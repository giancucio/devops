from pathlib import Path

AWS_ROOT = Path('infrastructure/terraform/aws')

VALID_MAIN = '''provider "aws" {
  region = var.aws_region
}

data "aws_region" "current" {}
'''

VALID_VARS = '''variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "tags" {
  type    = map(string)
  default = {}
}
'''

VALID_OUTPUTS = '''output "current_region" {
  description = "Current AWS region in the module."
  value       = data.aws_region.current.name
}
'''

VALID_VERSIONS = '''terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
'''


def is_boilerplate(text: str) -> bool:
    stripped = text.lstrip()
    if not stripped:
        return True
    if stripped.startswith('# Security'):
        return True
    if stripped.startswith('If you discover a security vulnerability'):
        return True
    return False


def fix_module(module_dir: Path):
    changed = []
    targets = {
        'main.tf': VALID_MAIN,
        'variables.tf': VALID_VARS,
        'outputs.tf': VALID_OUTPUTS,
        'versions.tf': VALID_VERSIONS,
    }
    for file_name, content in targets.items():
        path = module_dir / file_name
        if path.exists() and is_boilerplate(path.read_text(encoding='utf-8')):
            path.write_text(content, encoding='utf-8')
            changed.append(str(path))
    return changed


def main():
    changed = []
    for module_dir in sorted(AWS_ROOT.rglob('*')):
        if module_dir.is_dir() and (module_dir / 'main.tf').exists():
            if (module_dir / 'main.tf').read_text(encoding='utf-8').lstrip().startswith('# Security'):
                changed.extend(fix_module(module_dir))
    print(f'Fixed {len(changed)} boilerplate AWS module files')
    for item in changed:
        print(item)


if __name__ == '__main__':
    main()
