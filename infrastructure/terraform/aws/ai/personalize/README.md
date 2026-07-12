# AWS Personalize

Path: `infrastructure/terraform/aws/ai/personalize`

## Purpose

Reusable AWS Terraform module/example for **Personalize**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "personalize" {
  source = "./infrastructure/terraform/aws/ai/personalize"
}
```

## Notes

Keep values generic and safe for public portfolio use.
