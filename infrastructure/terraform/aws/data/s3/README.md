# AWS S3

Path: `infrastructure/terraform/aws/data/s3`

## Purpose

Reusable AWS Terraform module/example for **S3**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "s3" {
  source = "./infrastructure/terraform/aws/data/s3"
}
```

## Notes

Keep values generic and safe for public portfolio use.
