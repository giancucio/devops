# AWS Cloudfront

Path: `modules/aws/networking/cloudfront`

## Purpose

Reusable AWS Terraform module/example for **Cloudfront**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "cloudfront" {
  source = "./modules/aws/networking/cloudfront"
}
```

## Notes

Keep values generic and safe for public portfolio use.
