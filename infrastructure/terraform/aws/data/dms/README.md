# AWS Dms

Path: `infrastructure/terraform/aws/data/dms`

## Purpose

Reusable AWS Terraform module/example for **Dms**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "dms" {
  source = "./infrastructure/terraform/aws/data/dms"
}
```

## Notes

Keep values generic and safe for public portfolio use.
