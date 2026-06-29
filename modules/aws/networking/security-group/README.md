# AWS Security Group

Path: `modules/aws/networking/security-group`

## Purpose

Reusable AWS Terraform module/example for **Security Group**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "security_group" {
  source = "./modules/aws/networking/security-group"
}
```

## Notes

Keep values generic and safe for public portfolio use.
