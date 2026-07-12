# AWS Vpc

Path: `infrastructure/terraform/aws/networking/vpc`

## Purpose

Reusable AWS Terraform module/example for **Vpc**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "vpc" {
  source = "./infrastructure/terraform/aws/networking/vpc"
}
```

## Notes

Keep values generic and safe for public portfolio use.
