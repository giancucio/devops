# AWS Kms

Path: `modules/aws/security/kms`

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
  source = "./modules/aws/security/kms"
}
```

## Notes

Keep values generic and safe for public portfolio use.
