# AWS Nat Gateway

Path: `modules/aws/networking/nat-gateway`

## Purpose

Reusable AWS Terraform module/example for **Nat Gateway**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "nat_gateway" {
  source = "./modules/aws/networking/nat-gateway"
}
```

## Notes

Keep values generic and safe for public portfolio use.
