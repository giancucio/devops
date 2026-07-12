# AWS Glue Job

Path: `infrastructure/terraform/aws/analytics/glue-job`

## Purpose

Reusable AWS Terraform module/example for **Glue Job**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "glue_job" {
  source = "./infrastructure/terraform/aws/analytics/glue-job"
}
```

## Notes

Keep values generic and safe for public portfolio use.
