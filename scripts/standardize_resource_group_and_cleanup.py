from pathlib import Path
import re

BASE = Path('infrastructure/terraform/azure')

def delete_backups():
    removed = []
    for p in BASE.rglob('*.tf.bak'):
        p.unlink()
        removed.append(str(p))
    for p in BASE.rglob('*.tf.bak2'):
        p.unlink()
        removed.append(str(p))
    return removed

def standardize_resource_group():
    changed_files = []
    # replace var.resourceGroupName -> var.resource_group_name in all tf files
    for tf in BASE.rglob('*.tf'):
        text = tf.read_text(encoding='utf-8')
        new_text = text.replace('var.resourceGroupName', 'var.resource_group_name')
        # replace any resource_group_name variable interpolation style
        if new_text != text:
            # also handle variable declaration rename in same folder variables.tf
            tf.write_text(new_text, encoding='utf-8')
            changed_files.append(str(tf))

    # rename variable declarations where present
    for vars_tf in BASE.rglob('variables.tf'):
        text = vars_tf.read_text(encoding='utf-8')
        if 'variable "resourceGroupName"' in text:
            # extract default value if present
            m = re.search(r'variable\s+"resourceGroupName"\s*\{([\s\S]*?)\n\}', text)
            default = None
            if m:
                body = m.group(1)
                md = re.search(r'default\s*=\s*"([^"]+)"', body)
                if md:
                    default = md.group(1)
            # replace declaration name
            new = text.replace('variable "resourceGroupName"', 'variable "resource_group_name"')
            # also replace any occurrences of resourceGroupName inside the block
            new = new.replace('resourceGroupName', 'resource_group_name')
            vars_tf.write_text(new, encoding='utf-8')
        else:
            # if variables.tf doesn't have resource_group_name but main.tf references it, ensure variable exists
            if 'var.resource_group_name' in Path(vars_tf.parent).glob('*.tf') and 'variable "resource_group_name"' not in text:
                # add default
                with open(vars_tf, 'a', encoding='utf-8') as f:
                    f.write('\nvariable "resource_group_name" {\n  type = "string"\n  default = "example-rg"\n}\n')

    return changed_files

def fix_sql_admin_passwords():
    changed = []
    for main_tf in BASE.rglob('main.tf'):
        text = main_tf.read_text(encoding='utf-8')
        if 'administrator_login_password' in text and 'var.administrator_password' not in text:
            # find literal password
            m = re.search(r'administrator_login_password\s*=\s*"([^"]*)"', text)
            if m:
                val = m.group(1)
                new_text = text.replace(m.group(0), 'administrator_login_password = var.administrator_password')
                main_tf.write_text(new_text, encoding='utf-8')
                # ensure variable exists
                vars_tf = main_tf.parent / 'variables.tf'
                if not vars_tf.exists():
                    vars_tf.write_text('', encoding='utf-8')
                vtext = vars_tf.read_text(encoding='utf-8')
                if 'variable "administrator_password"' not in vtext:
                    with open(vars_tf, 'a', encoding='utf-8') as f:
                        f.write('\nvariable "administrator_password" {\n  type = "string"\n  default = "' + val + '"\n}\n')
                changed.append(str(main_tf))
    return changed

def run():
    removed = delete_backups()
    std_changed = standardize_resource_group()
    pwd_changed = fix_sql_admin_passwords()
    print('Removed backups:', len(removed))
    print('Files modified for resource_group_name:', len(std_changed))
    print('Files modified for admin passwords:', len(pwd_changed))

if __name__ == '__main__':
    run()
