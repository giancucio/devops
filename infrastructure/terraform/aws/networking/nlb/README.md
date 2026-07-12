# AWS Nlb

Path: `infrastructure/terraform/aws/networking/nlb`

## Purpose

Reusable AWS Terraform module/example for **Nlb**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "nlb" {
  source = "./infrastructure/terraform/aws/networking/nlb"
}
```

## Notes

Keep values generic and safe for public portfolio use.
