# AWS Iam

Path: `modules/aws/security/iam`

## Purpose

Reusable AWS Terraform module/example for **Iam**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "iam" {
  source = "./modules/aws/security/iam"
}
```

## Notes

Keep values generic and safe for public portfolio use.
