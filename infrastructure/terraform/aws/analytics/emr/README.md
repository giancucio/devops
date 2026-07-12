# AWS Emr

Path: `infrastructure/terraform/aws/analytics/emr`

## Purpose

Reusable AWS Terraform module/example for **Emr**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "emr" {
  source = "./infrastructure/terraform/aws/analytics/emr"
}
```

## Notes

Keep values generic and safe for public portfolio use.
