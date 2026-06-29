# AWS Private Hosted Zone

Path: `modules/aws/networking/private-hosted-zone`

## Purpose

Reusable AWS Terraform module/example for **Private Hosted Zone**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "private_hosted_zone" {
  source = "./modules/aws/networking/private-hosted-zone"
}
```

## Notes

Keep values generic and safe for public portfolio use.
