# AWS Athena

Path: `infrastructure/terraform/aws/data/athena`

## Purpose

Reusable AWS Terraform module/example for **Athena**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "athena" {
  source = "./infrastructure/terraform/aws/data/athena"
}
```

## Notes

Keep values generic and safe for public portfolio use.
