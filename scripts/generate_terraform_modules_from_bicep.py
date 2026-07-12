from pathlib import Path
import json
import re

BASE_BICEP = Path('infrastructure/bicep/azure')
BASE_TF = Path('infrastructure/terraform/azure')


def parse_parameters_json(module_dir):
    pfile = module_dir / 'main.parameters.json'
    if not pfile.exists():
        return None
    try:
        data = json.loads(pfile.read_text())
        params = []
        for name, entry in data.get('parameters', {}).items():
            value = entry.get('value')
            ptype = 'string'
            if isinstance(value, bool):
                ptype = 'bool'
            elif isinstance(value, int):
                ptype = 'int'
            elif isinstance(value, list):
                ptype = 'array'
            params.append((name, ptype, value))
        return params
    except Exception:
        return None


def parse_bicep_for_params_outputs(module_dir):
    bfile = module_dir / 'main.bicep'
    params = []
    outputs = []
    if not bfile.exists():
        return params, outputs
    text = bfile.read_text()
    # params: param name type = default
    for m in re.finditer(r"param\s+(\w+)\s+(\w+)(?:\s*=\s*([^\n]+))?", text):
        name = m.group(1)
        ptype = m.group(2)
        default = m.group(3)
        if default is not None:
            default = default.strip()
            # strip surrounding quotes
            if default.startswith("'") and default.endswith("'"):
                default = default[1:-1]
            else:
                try:
                    default = json.loads(default)
                except Exception:
                    pass
        else:
            default = None
        params.append((name, ptype, default))
    # outputs: output name type = value
    for m in re.finditer(r"output\s+(\w+)\s+(\w+)\s*=\s*([^\n]+)", text):
        name = m.group(1)
        ptype = m.group(2)
        value = m.group(3).strip()
        outputs.append((name, ptype, value))
    return params, outputs


def tf_type(bicep_type):
    if bicep_type in ('string',):
        return 'string'
    if bicep_type in ('int', 'uint', 'number'):
        return 'number'
    if bicep_type in ('bool', 'boolean'):
        return 'bool'
    if bicep_type in ('array',):
        return 'list(any)'
    return 'any'


def format_tf_default(value):
    if value is None:
        return None
    if isinstance(value, str):
        return f'"{value}"'
    if isinstance(value, bool):
        return 'true' if value else 'false'
    if isinstance(value, (int, float)):
        return str(value)
    if isinstance(value, list):
        parts = []
        for v in value:
            fv = format_tf_default(v)
            if fv is None:
                fv = '""'
            parts.append(fv)
        inner = ', '.join(parts)
        return f'[{inner}]'
    return None


def write_tf_module(rel_path, params, outputs, resource_hint=None):
    module_dir = BASE_TF / rel_path
    module_dir.mkdir(parents=True, exist_ok=True)
    # main.tf - emit azurerm resources for common resource types
    main_tf = module_dir / 'main.tf'
    lines = []
    # helper to get name variable
    name_var = None
    for n, _, _ in params:
        if n.lower().endswith('name') or n.lower() == 'name':
            name_var = n
            break
    has_location = any(n == 'location' for n, _, _ in params)

    def var_or_placeholder(varname, placeholder):
        for n, _, _ in params:
            if n == varname:
                return f'var.{varname}'
        return f'"{placeholder}"'

    # mapping for a handful of common resource types
    mapping = {
        'Microsoft.Storage/storageAccounts': lambda: [
            'resource "azurerm_storage_account" "this" {',
            f'  name = {var_or_placeholder(name_var, "stgacct")}' if name_var else '  name = "stgacctplaceholder"',
            f'  resource_group_name = {var_or_placeholder("resourceGroupName", "example-rg")}',
            f'  location = var.location' if has_location else f'  location = "eastus"',
            '  account_tier = "Standard"',
            '  account_replication_type = "LRS"',
            '}'
        ],
        'Microsoft.KeyVault/vaults': lambda: [
            'resource "azurerm_key_vault" "this" {',
            f'  name = {var_or_placeholder(name_var, "kvplaceholder")}' if name_var else '  name = "kvplaceholder"',
            f'  location = var.location' if has_location else '  location = "eastus"',
            f'  resource_group_name = {var_or_placeholder("resourceGroupName", "example-rg")}',
            '  tenant_id = "REPLACE_TENANT_ID"',
            '  sku_name = "standard"',
            '}'
        ],
        'Microsoft.Network/virtualNetworks': lambda: [
            'resource "azurerm_virtual_network" "this" {',
            f'  name = {var_or_placeholder(name_var, "vnetplaceholder")}' if name_var else '  name = "vnetplaceholder"',
            f'  resource_group_name = {var_or_placeholder("resourceGroupName", "example-rg")}',
            f'  location = var.location' if has_location else '  location = "eastus"',
            '  address_space = ["10.0.0.0/16"]',
            '}'
        ],
        'Microsoft.Network/virtualNetworks/subnets': lambda: [
            'resource "azurerm_subnet" "this" {',
            f'  name = {var_or_placeholder(name_var, "subnetplaceholder")}' if name_var else '  name = "subnetplaceholder"',
            f'  resource_group_name = {var_or_placeholder("resourceGroupName", "example-rg")}',
            '  virtual_network_name = "REPLACE_VNET_NAME"',
            '  address_prefixes = ["10.0.1.0/24"]',
            '}'
        ],
        'Microsoft.Network/networkSecurityGroups': lambda: [
            'resource "azurerm_network_security_group" "this" {',
            f'  name = {var_or_placeholder(name_var, "nsgplaceholder")}' if name_var else '  name = "nsgplaceholder"',
            f'  resource_group_name = {var_or_placeholder("resourceGroupName", "example-rg")}',
            '  location = var.location' if has_location else '  location = "eastus"',
            '}'
        ],
        'Microsoft.ContainerService/managedClusters': lambda: [
            'resource "azurerm_kubernetes_cluster" "this" {',
            f'  name = {var_or_placeholder(name_var, "akscluster")}' if name_var else '  name = "akscluster"',
            f'  location = var.location' if has_location else '  location = "eastus"',
            f'  resource_group_name = {var_or_placeholder("resourceGroupName", "example-rg")}',
            '  default_node_pool {',
            '    name = "default"',
            '    node_count = 1',
            '    vm_size = "Standard_DS2_v2"',
            '  }',
            '  dns_prefix = "aksdns"',
            '  identity { type = "SystemAssigned" }',
            '}'
        ],
        'Microsoft.Web/sites': lambda: [
            'resource "azurerm_app_service" "this" {',
            f'  name = {var_or_placeholder(name_var, "appplaceholder")}' if name_var else '  name = "appplaceholder"',
            f'  location = var.location' if has_location else '  location = "eastus"',
            f'  resource_group_name = {var_or_placeholder("resourceGroupName", "example-rg")}',
            '  app_service_plan_id = "REPLACE_APP_SERVICE_PLAN_ID"',
            '}'
        ],
        'Microsoft.Web/serverfarms': lambda: [
            'resource "azurerm_app_service_plan" "this" {',
            f'  name = {var_or_placeholder(name_var, "aspplaceholder")}' if name_var else '  name = "aspplaceholder"',
            f'  location = var.location' if has_location else '  location = "eastus"',
            f'  resource_group_name = {var_or_placeholder("resourceGroupName", "example-rg")}',
            '  sku {',
            '    tier = "Standard"',
            '    size = "S1"',
            '  }',
            '}'
        ],
        'Microsoft.Sql/servers/databases': lambda: [
            'resource "azurerm_mssql_server" "this" {',
            f'  name = {var_or_placeholder("sqlServerName" if any(n=="sqlServerName" for n,_,_ in params) else name_var, "sqlserver")}',
            f'  resource_group_name = {var_or_placeholder("resourceGroupName", "example-rg")}',
            f'  location = var.location' if has_location else '  location = "eastus"',
            '  administrator_login = "sqladmin"',
            '  administrator_login_password = "REPLACE_ME"',
            '}'
        ],
        'Microsoft.DocumentDB/databaseAccounts': lambda: [
            'resource "azurerm_cosmosdb_account" "this" {',
            f'  name = {var_or_placeholder(name_var, "cosmosplaceholder")}' if name_var else '  name = "cosmosplaceholder"',
            f'  location = var.location' if has_location else '  location = "eastus"',
            f'  resource_group_name = {var_or_placeholder("resourceGroupName", "example-rg")}',
            '  offer_type = "Standard"',
            '  consistency_policy {',
            '    consistency_level = "Session"',
            '  }',
            '}'
        ],
    }

    wrote = False
    if resource_hint:
        # remove version suffix if present
        hint = resource_hint.split('@')[0]
        for key, fn in mapping.items():
            if hint.startswith(key):
                lines.extend(fn())
                wrote = True
                break
    if not wrote:
        # fallback: emit a minimal azurerm_resource_group to ensure an azurerm block exists
        if name_var:
            lines.append('resource "azurerm_resource_group" "this" {')
            lines.append(f'  name = {var_or_placeholder(name_var, "rgplaceholder")}')
            lines.append(f'  location = var.location' if has_location else '  location = "eastus"')
            lines.append('}')
        else:
            lines.append('resource "azurerm_resource_group" "this" {')
            lines.append(f'  name = {var_or_placeholder("resourceGroupName", "example-rg")}')
            lines.append(f'  location = var.location' if has_location else '  location = "eastus"')
            lines.append('}')
    main_tf.write_text('\n'.join(lines) + '\n')

    # variables.tf
    vars_tf = module_dir / 'variables.tf'
    vlines = []
    for name, ptype, default in params:
        tf_t = tf_type(ptype)
        vlines.append(f'variable "{name}" {{')
        vlines.append(f'  type = {tf_t}')
        d = format_tf_default(default)
        if d is not None:
            vlines.append(f'  default = {d}')
        vlines.append('}')
        vlines.append('')
    vars_tf.write_text('\n'.join(vlines) + '\n')

    # outputs.tf
    out_tf = module_dir / 'outputs.tf'
    olines = []
    for name, ptype, value in outputs:
        olines.append(f'output "{name}" {{')
        olines.append('  description = "Auto-generated output (set value in module implementation)"')
        olines.append('  value = "TODO: set appropriate resource attribute"')
        olines.append('}')
        olines.append('')
    out_tf.write_text('\n'.join(olines) + '\n')

    # README.md
    readme = module_dir / 'README.md'
    rlines = [f'# {rel_path}', '', 'This Terraform module was generated as a skeleton from the corresponding Bicep module.', '']
    if params:
        rlines.append('## Variables')
        rlines.append('')
        for name, ptype, default in params:
            d = f' (default: {default})' if default is not None else ''
            rlines.append(f'- `{name}` ({ptype}){d}')
        rlines.append('')
    if outputs:
        rlines.append('## Outputs')
        rlines.append('')
        for name, ptype, value in outputs:
            rlines.append(f'- `{name}` ({ptype})')
        rlines.append('')
    rlines.extend(['## Example', '', '```hcl', f'module "{rel_path.replace("/","_")}" {{', f'  source = "../../../../infrastructure/terraform/azure/{rel_path}"', '  # set variables here', '}', '```'])
    readme.write_text('\n'.join(rlines) + '\n')


def main():
    if not BASE_BICEP.exists():
        print('No Bicep base directory found at', BASE_BICEP)
        return
    count = 0
    for module_dir in BASE_BICEP.rglob('*'):
        if module_dir.is_dir() and (module_dir / 'main.bicep').exists():
            rel = module_dir.relative_to(BASE_BICEP).as_posix()
            # parse params and outputs
            params = []
            parsed = parse_parameters_json(module_dir)
            if parsed:
                for name, ptype, default in parsed:
                    params.append((name, ptype, default))
            else:
                p_params, p_outputs = parse_bicep_for_params_outputs(module_dir)
                params = p_params
            # outputs
            _, p_outputs = parse_bicep_for_params_outputs(module_dir)
            outputs = p_outputs
            # try to extract resource type hint
            resource_hint = None
            m = re.search(r"resource\s+\w+\s+'([^']+)'", (module_dir / 'main.bicep').read_text())
            if m:
                resource_hint = m.group(1)
            write_tf_module(rel, params, outputs, resource_hint)
            count += 1
    print(f'Generated {count} Terraform module skeletons under {BASE_TF}')


if __name__ == '__main__':
    main()
