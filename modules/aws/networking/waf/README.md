# AWS Waf

Path: `modules/aws/networking/waf`

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
  source = "./modules/aws/networking/waf"
}
```

## Notes

Keep values generic and safe for public portfolio use.
