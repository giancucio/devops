# AWS Athena Database

Path: `modules/aws/analytics/athena-database`

## Purpose

Reusable AWS Terraform module/example for **Athena Database**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "athena_database" {
  source = "./modules/aws/analytics/athena-database"
}
```

## Notes

Keep values generic and safe for public portfolio use.
