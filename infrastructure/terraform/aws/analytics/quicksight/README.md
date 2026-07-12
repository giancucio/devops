# AWS Quicksight

Path: `infrastructure/terraform/aws/analytics/quicksight`

## Purpose

Reusable AWS Terraform module/example for **Quicksight**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "quicksight" {
  source = "./infrastructure/terraform/aws/analytics/quicksight"
}
```

## Notes

Keep values generic and safe for public portfolio use.
