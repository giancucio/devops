# AWS Ecr

Path: `infrastructure/terraform/aws/containers/ecr`

## Purpose

Reusable AWS Terraform module/example for **Ecr**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "ecr" {
  source = "./infrastructure/terraform/aws/containers/ecr"
}
```

## Notes

Keep values generic and safe for public portfolio use.
