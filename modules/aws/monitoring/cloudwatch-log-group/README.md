# AWS Cloudwatch Log Group

Path: `modules/aws/monitoring/cloudwatch-log-group`

## Purpose

Reusable AWS Terraform module/example for **Cloudwatch Log Group**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "cloudwatch_log_group" {
  source = "./modules/aws/monitoring/cloudwatch-log-group"
}
```

## Notes

Keep values generic and safe for public portfolio use.
