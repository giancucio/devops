# AWS Internet Gateway

Path: `infrastructure/terraform/aws/networking/internet-gateway`

## Purpose

Reusable AWS Terraform module/example for **Internet Gateway**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "internet_gateway" {
  source = "./infrastructure/terraform/aws/networking/internet-gateway"
}
```

## Notes

Keep values generic and safe for public portfolio use.
