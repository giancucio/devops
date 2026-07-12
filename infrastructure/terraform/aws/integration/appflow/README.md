# AWS Appflow

Path: `infrastructure/terraform/aws/integration/appflow`

## Purpose

Reusable AWS Terraform module/example for **Appflow**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "appflow" {
  source = "./infrastructure/terraform/aws/integration/appflow"
}
```

## Notes

Keep values generic and safe for public portfolio use.
