# AWS Naming

Path: `modules/aws/foundation/naming`

## Purpose

Reusable AWS Terraform module/example for **Naming**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "naming" {
  source = "./modules/aws/foundation/naming"
}
```

## Notes

Keep values generic and safe for public portfolio use.
