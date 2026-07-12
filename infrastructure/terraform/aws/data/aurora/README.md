# AWS Aurora

Path: `infrastructure/terraform/aws/data/aurora`

## Purpose

Reusable AWS Terraform module/example for **Aurora**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "aurora" {
  source = "./infrastructure/terraform/aws/data/aurora"
}
```

## Notes

Keep values generic and safe for public portfolio use.
