# AWS Organizations

Path: `infrastructure/terraform/aws/foundation/organizations`

## Purpose

Reusable AWS Terraform module/example for **Organizations**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "organizations" {
  source = "./infrastructure/terraform/aws/foundation/organizations"
}
```

## Notes

Keep values generic and safe for public portfolio use.
