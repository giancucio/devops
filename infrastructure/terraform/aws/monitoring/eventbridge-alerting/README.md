# AWS Eventbridge Alerting

Path: `infrastructure/terraform/aws/monitoring/eventbridge-alerting`

## Purpose

Reusable AWS Terraform module/example for **Eventbridge Alerting**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "eventbridge_alerting" {
  source = "./infrastructure/terraform/aws/monitoring/eventbridge-alerting"
}
```

## Notes

Keep values generic and safe for public portfolio use.
