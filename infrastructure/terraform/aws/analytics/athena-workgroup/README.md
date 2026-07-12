# AWS Athena Workgroup

Path: `infrastructure/terraform/aws/analytics/athena-workgroup`

## Purpose

Reusable AWS Terraform module/example for **Athena Workgroup**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "athena_workgroup" {
  source = "./infrastructure/terraform/aws/analytics/athena-workgroup"
}
```

## Notes

Keep values generic and safe for public portfolio use.
