# AWS Lambda Integration

Path: `infrastructure/terraform/aws/integration/lambda-integration`

## Purpose

Reusable AWS Terraform module/example for **Lambda Integration**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "lambda_integration" {
  source = "./infrastructure/terraform/aws/integration/lambda-integration"
}
```

## Notes

Keep values generic and safe for public portfolio use.
