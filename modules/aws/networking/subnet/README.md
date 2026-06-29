# AWS Subnet

Path: `modules/aws/networking/subnet`

## Purpose

Reusable AWS Terraform module/example for **Subnet**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "subnet" {
  source = "./modules/aws/networking/subnet"
}
```

## Notes

Keep values generic and safe for public portfolio use.
