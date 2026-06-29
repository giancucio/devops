# AWS Security Hub

Path: `modules/aws/security/security-hub`

## Purpose

Reusable AWS Terraform module/example for **Security Hub**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "security_hub" {
  source = "./modules/aws/security/security-hub"
}
```

## Notes

Keep values generic and safe for public portfolio use.
