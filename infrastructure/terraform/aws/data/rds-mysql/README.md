# AWS Rds Mysql

Path: `infrastructure/terraform/aws/data/rds-mysql`

## Purpose

Reusable AWS Terraform module/example for **Rds Mysql**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "rds_mysql" {
  source = "./infrastructure/terraform/aws/data/rds-mysql"
}
```

## Notes

Keep values generic and safe for public portfolio use.
