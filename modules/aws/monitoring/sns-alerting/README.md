# AWS Sns Alerting

Path: `modules/aws/monitoring/sns-alerting`

## Purpose

Reusable AWS Terraform module/example for **Sns Alerting**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "sns_alerting" {
  source = "./modules/aws/monitoring/sns-alerting"
}
```

## Notes

Keep values generic and safe for public portfolio use.
