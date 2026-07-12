# AWS Lambda

Path: `infrastructure/terraform/aws/compute/lambda`

## Purpose

Reusable AWS Terraform module/example for **Lambda**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "lambda" {
  source = "./infrastructure/terraform/aws/compute/lambda"
}
```

## Notes

Keep values generic and safe for public portfolio use.
