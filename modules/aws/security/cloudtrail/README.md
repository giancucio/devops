# AWS Cloudtrail

Path: `modules/aws/security/cloudtrail`

## Purpose

Reusable AWS Terraform module/example for **Cloudtrail**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "cloudtrail" {
  source = "./modules/aws/security/cloudtrail"
}
```

## Notes

Keep values generic and safe for public portfolio use.
