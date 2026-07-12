# AWS Dynamodb

Path: `infrastructure/terraform/aws/data/dynamodb`

## Purpose

Reusable AWS Terraform module/example for **Dynamodb**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "dynamodb" {
  source = "./infrastructure/terraform/aws/data/dynamodb"
}
```

## Notes

Keep values generic and safe for public portfolio use.
