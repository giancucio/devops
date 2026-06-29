# AWS Elastic Beanstalk

Path: `modules/aws/compute/elastic-beanstalk`

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
  source = "./modules/aws/compute/elastic-beanstalk"
}
```

## Notes

Keep values generic and safe for public portfolio use.
