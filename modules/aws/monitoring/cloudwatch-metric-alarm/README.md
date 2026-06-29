# AWS Cloudwatch Metric Alarm

Path: `modules/aws/monitoring/cloudwatch-metric-alarm`

## Purpose

Reusable AWS Terraform module/example for **Cloudwatch Metric Alarm**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "cloudwatch_metric_alarm" {
  source = "./modules/aws/monitoring/cloudwatch-metric-alarm"
}
```

## Notes

Keep values generic and safe for public portfolio use.
