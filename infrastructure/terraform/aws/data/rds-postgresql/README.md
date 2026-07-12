# AWS Rds Postgresql

Path: `infrastructure/terraform/aws/data/rds-postgresql`

## Purpose

Reusable AWS Terraform module/example for **Rds Postgresql**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "rds_postgresql" {
  source = "./infrastructure/terraform/aws/data/rds-postgresql"
}
```

## Notes

Keep values generic and safe for public portfolio use.
