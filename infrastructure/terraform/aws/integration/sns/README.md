# AWS Sns

Path: `infrastructure/terraform/aws/integration/sns`

## Purpose

Reusable AWS Terraform module/example for **Sns**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "sns" {
  source = "./infrastructure/terraform/aws/integration/sns"
}
```

## Notes

Keep values generic and safe for public portfolio use.
