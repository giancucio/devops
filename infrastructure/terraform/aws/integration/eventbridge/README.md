# AWS Eventbridge

Path: `infrastructure/terraform/aws/integration/eventbridge`

## Purpose

Reusable AWS Terraform module/example for **Eventbridge**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "eventbridge" {
  source = "./infrastructure/terraform/aws/integration/eventbridge"
}
```

## Notes

Keep values generic and safe for public portfolio use.
