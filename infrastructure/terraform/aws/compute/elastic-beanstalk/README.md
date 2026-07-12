# AWS Elastic Beanstalk

Path: `infrastructure/terraform/aws/compute/elastic-beanstalk`

## Purpose

Reusable AWS Terraform module/example for **Elastic Beanstalk**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "elastic_beanstalk" {
  source = "./infrastructure/terraform/aws/compute/elastic-beanstalk"
}
```

## Notes

Keep values generic and safe for public portfolio use.
