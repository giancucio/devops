from pathlib import Path
import re

BASE_TF = Path('infrastructure/terraform/azure')

# keys to promote: mapping key -> (variable_name, type)
PROMOTE_KEYS = {
    'location': ('location', 'string'),
    'capacity': ('capacity', 'number'),
    'family': ('family', 'string'),
    'sku_name': ('sku_name', 'string'),
    'account_tier': ('account_tier', 'string'),
    'account_replication_type': ('account_replication_type', 'string'),
    'administrator_password': ('administrator_password', 'string'),
    'administrator_login': ('administrator_login', 'string'),
    'sku': ('sku', 'string'),
    'offer_type': ('offer_type', 'string'),
    'consistency_level': ('consistency_level', 'string'),
    'node_count': ('node_count', 'number'),
    'vm_size': ('vm_size', 'string'),
}


def variable_exists(vars_text, var_name):
    return re.search(rf'variable\s+"{re.escape(var_name)}"', vars_text) is not None


def write_variable_block(fpath, var_name, var_type, default_value):
    # default_value should be raw string with quotes if string, or number
    block = []
    block.append(f'variable "{var_name}" {{')
    block.append(f'  type = {"string" if var_type=="string" else "number"}')
    block.append(f'  default = {default_value}')
    block.append('}')
    block.append('')
    with open(fpath, 'a', encoding='utf-8') as f:
        f.write('\n'.join(block))


def promote_in_file(main_tf):
    text = main_tf.read_text(encoding='utf-8')
    replacements = {}
    # string literal pattern
    for key, (var_name, var_type) in PROMOTE_KEYS.items():
        # match lines like: key = "value"
        pattern_str = re.compile(rf'(^\s*{re.escape(key)}\s*=\s*"([^"]+)")', re.MULTILINE)
        m = pattern_str.search(text)
        if m:
            full, val = m.group(1), m.group(2)
            # replace with var reference
            text = text.replace(full, f'{key} = var.{var_name}')
            default_value = f'"{val}"' if var_type == 'string' else val
            replacements[var_name] = (var_type, default_value)

        # numeric pattern: key = 123
        pattern_num = re.compile(rf'(^\s*{re.escape(key)}\s*=\s*(\d+))', re.MULTILINE)
        m2 = pattern_num.search(text)
        if m2:
            full, val = m2.group(1), m2.group(2)
            text = text.replace(full, f'{key} = var.{var_name}')
            default_value = val
            replacements[var_name] = (var_type, default_value)

    if replacements:
        # backup
        bak = main_tf.with_suffix('.tf.bak')
        bak.write_text(main_tf.read_text(encoding='utf-8'), encoding='utf-8')
        main_tf.write_text(text, encoding='utf-8')

        # update variables.tf
        vars_tf = main_tf.parent / 'variables.tf'
        existing = ''
        if vars_tf.exists():
            existing = vars_tf.read_text(encoding='utf-8')
        else:
            vars_tf.write_text('', encoding='utf-8')

        for var_name, (var_type, default_value) in replacements.items():
            if not variable_exists(existing, var_name):
                write_variable_block(vars_tf, var_name, var_type, default_value)

        return True, list(replacements.keys())
    return False, []


def run():
    changed = []
    for main_tf in BASE_TF.rglob('main.tf'):
        ok, vars_written = promote_in_file(main_tf)
        if ok:
            changed.append((str(main_tf), vars_written))

    print(f'Promoted literals in {len(changed)} modules')
    for f, v in changed:
        print(f, '->', v)


if __name__ == '__main__':
    run()
