# AWS Vpc

Path: `modules/aws/networking/vpc`

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
  source = "./modules/aws/networking/vpc"
}
```

## Notes

Keep values generic and safe for public portfolio use.
