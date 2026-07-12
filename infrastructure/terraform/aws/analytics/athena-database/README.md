# AWS Athena Database

Path: `infrastructure/terraform/aws/analytics/athena-database`

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
  source = "./infrastructure/terraform/aws/analytics/athena-database"
}
```

## Notes

Keep values generic and safe for public portfolio use.
