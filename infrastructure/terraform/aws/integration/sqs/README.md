# AWS Sqs

Path: `infrastructure/terraform/aws/integration/sqs`

## Purpose

Reusable AWS Terraform module/example for **Sqs**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "sqs" {
  source = "./infrastructure/terraform/aws/integration/sqs"
}
```

## Notes

Keep values generic and safe for public portfolio use.
