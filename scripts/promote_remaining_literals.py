from pathlib import Path
import re

BASE_TF = Path('infrastructure/terraform/azure')

# keys to promote to variables; map to variable name to use
PROMOTE = {
    'resource_group_name': 'resourceGroupName',
    'administrator_password': 'administrator_password',
    'administrator_login': 'administrator_login',
    'resource_group': 'resourceGroupName',
}


def variable_exists(vars_text, var_name):
    return re.search(rf'variable\s+"{re.escape(var_name)}"', vars_text) is not None


def append_variable(vars_tf, var_name, default_value):
    var_type = 'string' if isinstance(default_value, str) else 'number'
    block = []
    block.append(f'variable "{var_name}" {{')
    block.append(f'  type = "{var_type}"')
    if var_type == 'string':
        block.append(f'  default = "{default_value}"')
    else:
        block.append(f'  default = {default_value}')
    block.append('}')
    block.append('')
    with open(vars_tf, 'a', encoding='utf-8') as f:
        f.write('\n'.join(block))


def promote_in_file(main_tf):
    text = main_tf.read_text(encoding='utf-8')
    replacements = {}

    for key, var_name in PROMOTE.items():
        # match key = "value"
        for m in re.finditer(rf'(^\s*{re.escape(key)}\s*=\s*"([^"]+)")', text, flags=re.MULTILINE):
            full, val = m.group(1), m.group(2)
            # skip if value already var reference
            if val.startswith('var.') or val.startswith('${var.'):
                continue
            text = text.replace(full, f'{key} = var.{var_name}')
            replacements[var_name] = val

        # match key = value (number)
        for m in re.finditer(rf'(^\s*{re.escape(key)}\s*=\s*(\d+))', text, flags=re.MULTILINE):
            full, val = m.group(1), m.group(2)
            text = text.replace(full, f'{key} = var.{var_name}')
            replacements[var_name] = int(val)

    if replacements:
        # backup
        bak = main_tf.with_suffix('.tf.bak2')
        bak.write_text(main_tf.read_text(encoding='utf-8'), encoding='utf-8')
        main_tf.write_text(text, encoding='utf-8')

        # update variables.tf
        vars_tf = main_tf.parent / 'variables.tf'
        if not vars_tf.exists():
            vars_tf.write_text('', encoding='utf-8')
        existing = vars_tf.read_text(encoding='utf-8')
        for var_name, default in replacements.items():
            if not variable_exists(existing, var_name):
                append_variable(vars_tf, var_name, default)

        return True, replacements
    return False, {}


def run():
    changed = []
    for main_tf in BASE_TF.rglob('main.tf'):
        ok, repl = promote_in_file(main_tf)
        if ok:
            changed.append((str(main_tf), repl))

    print(f'Promoted remaining literals in {len(changed)} modules')
    for f, r in changed:
        print(f, '->', r)


if __name__ == '__main__':
    run()
