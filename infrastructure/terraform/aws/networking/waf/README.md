# AWS Waf

Path: `infrastructure/terraform/aws/networking/waf`

## Purpose

Reusable AWS Terraform module/example for **Waf**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "waf" {
  source = "./infrastructure/terraform/aws/networking/waf"
}
```

## Notes

Keep values generic and safe for public portfolio use.
