# AWS Route53

Path: `infrastructure/terraform/aws/networking/route53`

## Purpose

Reusable AWS Terraform module/example for **Route53**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "route53" {
  source = "./infrastructure/terraform/aws/networking/route53"
}
```

## Notes

Keep values generic and safe for public portfolio use.
