# AWS Cloudtrail

Path: `infrastructure/terraform/aws/security/cloudtrail`

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
  source = "./infrastructure/terraform/aws/security/cloudtrail"
}
```

## Notes

Keep values generic and safe for public portfolio use.
