# AWS Secrets Manager

Path: `modules/aws/security/secrets-manager`

## Purpose

Reusable AWS Terraform module/example for **Secrets Manager**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "secrets_manager" {
  source = "./modules/aws/security/secrets-manager"
}
```

## Notes

Keep values generic and safe for public portfolio use.
