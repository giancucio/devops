# AWS Inspector

Path: `infrastructure/terraform/aws/security/inspector`

## Purpose

Reusable AWS Terraform module/example for **Inspector**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "inspector" {
  source = "./infrastructure/terraform/aws/security/inspector"
}
```

## Notes

Keep values generic and safe for public portfolio use.
