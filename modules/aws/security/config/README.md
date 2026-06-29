# AWS Config

Path: `modules/aws/security/config`

## Purpose

Reusable AWS Terraform module/example for **Config**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "config" {
  source = "./modules/aws/security/config"
}
```

## Notes

Keep values generic and safe for public portfolio use.
