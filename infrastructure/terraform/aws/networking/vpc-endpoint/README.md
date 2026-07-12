# AWS Vpc Endpoint

Path: `infrastructure/terraform/aws/networking/vpc-endpoint`

## Purpose

Reusable AWS Terraform module/example for **Vpc Endpoint**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "vpc_endpoint" {
  source = "./infrastructure/terraform/aws/networking/vpc-endpoint"
}
```

## Notes

Keep values generic and safe for public portfolio use.
