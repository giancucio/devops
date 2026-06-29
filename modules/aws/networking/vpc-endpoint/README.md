# AWS Vpc Endpoint

Path: `modules/aws/networking/vpc-endpoint`

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
  source = "./modules/aws/networking/vpc-endpoint"
}
```

## Notes

Keep values generic and safe for public portfolio use.
