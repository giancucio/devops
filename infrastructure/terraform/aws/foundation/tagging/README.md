# AWS Tagging

Path: `infrastructure/terraform/aws/foundation/tagging`

## Purpose

Reusable AWS Terraform module/example for **Tagging**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "tagging" {
  source = "./infrastructure/terraform/aws/foundation/tagging"
}
```

## Notes

Keep values generic and safe for public portfolio use.
