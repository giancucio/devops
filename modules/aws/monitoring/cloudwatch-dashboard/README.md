# AWS Cloudwatch Dashboard

Path: `modules/aws/monitoring/cloudwatch-dashboard`

## Purpose

Reusable AWS Terraform module/example for **Cloudwatch Dashboard**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "cloudwatch_dashboard" {
  source = "./modules/aws/monitoring/cloudwatch-dashboard"
}
```

## Notes

Keep values generic and safe for public portfolio use.
