# AWS Redshift

Path: `infrastructure/terraform/aws/data/redshift`

## Purpose

Reusable AWS Terraform module/example for **Redshift**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "redshift" {
  source = "./infrastructure/terraform/aws/data/redshift"
}
```

## Notes

Keep values generic and safe for public portfolio use.
