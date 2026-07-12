from pathlib import Path
import re
import json

BASE_TF = Path('infrastructure/terraform/azure')
BASE_BICEP = Path('infrastructure/bicep/azure')

# map Bicep resource type prefix -> function that returns azurerm block lines
def map_storage(name_var, has_location, params):
    return [
        'resource "azurerm_storage_account" "this" {',
        f'  name = var.{name_var}',
        '  resource_group_name = var.resourceGroupName',
        ('  location = var.location' if has_location else '  location = "eastus"'),
        '  account_tier = "Standard"',
        '  account_replication_type = "LRS"',
        '}',
    ]

def map_redis(name_var, has_location, params):
    return [
        'resource "azurerm_redis_cache" "this" {',
        f'  name = var.{name_var}',
        '  resource_group_name = var.resourceGroupName',
        ('  location = var.location' if has_location else '  location = "eastus"'),
        '  capacity = 1',
        '  family = "C"',
        '  sku_name = "Standard"',
        '}',
    ]

def map_cosmos(name_var, has_location, params):
    return [
        'resource "azurerm_cosmosdb_account" "this" {',
        f'  name = var.{name_var}',
        '  location = var.location',
        '  resource_group_name = var.resourceGroupName',
        '  offer_type = "Standard"',
        '  consistency_policy {',
        '    consistency_level = "Session"',
        '  }',
        '}',
    ]

def map_postgresql(name_var, has_location, params):
    return [
        'resource "azurerm_postgresql_flexible_server" "this" {',
        f'  name = var.{name_var}',
        '  resource_group_name = var.resourceGroupName',
        ('  location = var.location' if has_location else '  location = "eastus"'),
        '  administrator_login = "psqladmin"',
        '  administrator_password = "REPLACE_ME"',
        '  sku_name = "GP_Gen5_2"',
        '}',
    ]

def map_eventhub(name_var, has_location, params):
    return [
        'resource "azurerm_eventhub_namespace" "this" {',
        f'  name = var.{name_var}',
        '  resource_group_name = var.resourceGroupName',
        ('  location = var.location' if has_location else '  location = "eastus"'),
        '  sku = "Standard"',
        '}',
    ]

def map_servicebus(name_var, has_location, params):
    return [
        'resource "azurerm_servicebus_namespace" "this" {',
        f'  name = var.{name_var}',
        '  resource_group_name = var.resourceGroupName',
        ('  location = var.location' if has_location else '  location = "eastus"'),
        '  sku = "Standard"',
        '}',
    ]

def map_aks(name_var, has_location, params):
    return [
        'resource "azurerm_kubernetes_cluster" "this" {',
        f'  name = var.{name_var}',
        '  location = var.location',
        '  resource_group_name = var.resourceGroupName',
        '  default_node_pool {',
        '    name = "default"',
        '    node_count = var.nodeCount',
        '    vm_size = var.nodeVmSize',
        '  }',
        '  identity { type = "SystemAssigned" }',
        '}',
    ]

COMMON_MAP = {
    'Microsoft.Storage/storageAccounts': map_storage,
    'Microsoft.Cache/Redis': map_redis,
    'Microsoft.DocumentDB/databaseAccounts': map_cosmos,
    'Microsoft.DBForPostgreSQL/flexibleServers': map_postgresql,
    'Microsoft.EventHub/namespaces': map_eventhub,
    'Microsoft.ServiceBus/namespaces': map_servicebus,
    'Microsoft.ContainerService/managedClusters': map_aks,
}


def deploy():
    files_changed = []
    for tf_main in BASE_TF.rglob('main.tf'):
        text = tf_main.read_text()
        if 'resource "azurerm_resource_group" "this"' not in text:
            continue
        rel = tf_main.parent.relative_to(BASE_TF).as_posix()
        bicep_file = BASE_BICEP / rel / 'main.bicep'
        resource_hint = None
        api_version = None
        if bicep_file.exists():
            btext = bicep_file.read_text()
            m = re.search(r"resource\s+\w+\s+'([^@']+)@([^']+)'", btext)
            if m:
                resource_hint = m.group(1)
                api_version = m.group(2)
            else:
                m2 = re.search(r"resource\s+\w+\s+'([^']+)'", btext)
                if m2:
                    full = m2.group(1)
                    if '@' in full:
                        resource_hint, api_version = full.split('@', 1)
                    else:
                        resource_hint = full

        # derive name var and location var presence
        has_location = 'var.location' in text or 'param location' in (bicep_file.read_text() if bicep_file.exists() else '')
        # choose name variable by checking variables.tf
        name_var = None
        vars_tf = tf_main.parent / 'variables.tf'
        if vars_tf.exists():
            vtext = vars_tf.read_text()
            for candidate in ['name', 'accountName', 'storageAccountName', 'clusterName', 'redisName', 'workspaceName', 'serverName', 'namespaceName']:
                if re.search(rf'variable\s+"{candidate}"', vtext):
                    name_var = candidate
                    break
        if not name_var:
            name_var = 'name'

        new_lines = None
        if resource_hint:
            # try exact match or prefix match
            for key in COMMON_MAP:
                if resource_hint.startswith(key):
                    new_lines = COMMON_MAP[key](name_var, has_location, None)
                    break
        if new_lines is None:
            # fallback to generic azurerm_resource using type and api_version
            type_arg = resource_hint if resource_hint else 'Microsoft.Resources/resourceGroups'
            api_arg = api_version if api_version else '2021-04-01'
            new_lines = [
                'resource "azurerm_resource" "this" {',
                f'  name = var.{name_var}',
                f'  type = "{type_arg}"',
                f'  api_version = "{api_arg}"',
                ('  location = var.location' if has_location else '  location = "eastus"'),
                '  resource_group_name = var.resourceGroupName',
                '  properties = {}',
                '}',
            ]

        # write backup and replace
        bak = tf_main.with_suffix('.tf.bak')
        bak.write_text(text)
        tf_main.write_text('\n'.join(new_lines) + '\n')
        files_changed.append(str(tf_main))

    print(f'Replaced fallback in {len(files_changed)} modules')
    for f in files_changed:
        print(f)


if __name__ == '__main__':
    deploy()
