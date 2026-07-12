# AWS Glue Crawler

Path: `infrastructure/terraform/aws/analytics/glue-crawler`

## Purpose

Reusable AWS Terraform module/example for **Glue Crawler**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "glue_crawler" {
  source = "./infrastructure/terraform/aws/analytics/glue-crawler"
}
```

## Notes

Keep values generic and safe for public portfolio use.
