# AWS Cloudwatch Container Insights

Path: `infrastructure/terraform/aws/monitoring/cloudwatch-container-insights`

## Purpose

Reusable AWS Terraform module/example for **Cloudwatch Container Insights**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "cloudwatch_container_insights" {
  source = "./infrastructure/terraform/aws/monitoring/cloudwatch-container-insights"
}
```

## Notes

Keep values generic and safe for public portfolio use.
