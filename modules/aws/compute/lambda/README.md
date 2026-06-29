# AWS Lambda

Path: `modules/aws/compute/lambda`

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
  source = "./modules/aws/compute/lambda"
}
```

## Notes

Keep values generic and safe for public portfolio use.
