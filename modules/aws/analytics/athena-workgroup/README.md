# AWS Athena Workgroup

Path: `modules/aws/analytics/athena-workgroup`

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
  source = "./modules/aws/analytics/athena-workgroup"
}
```

## Notes

Keep values generic and safe for public portfolio use.
