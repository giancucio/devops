# AWS Kms

Path: `infrastructure/terraform/aws/security/kms`

## Purpose

Reusable AWS Terraform module/example for **Kms**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "kms" {
  source = "./infrastructure/terraform/aws/security/kms"
}
```

## Notes

Keep values generic and safe for public portfolio use.
