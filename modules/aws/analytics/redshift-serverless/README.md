# AWS Redshift Serverless

Path: `modules/aws/analytics/redshift-serverless`

## Purpose

Reusable AWS Terraform module/example for **Redshift Serverless**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "redshift_serverless" {
  source = "./modules/aws/analytics/redshift-serverless"
}
```

## Notes

Keep values generic and safe for public portfolio use.
