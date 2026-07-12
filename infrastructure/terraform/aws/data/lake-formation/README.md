# AWS Lake Formation

Path: `infrastructure/terraform/aws/data/lake-formation`

## Purpose

Reusable AWS Terraform module/example for **Lake Formation**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "lake_formation" {
  source = "./infrastructure/terraform/aws/data/lake-formation"
}
```

## Notes

Keep values generic and safe for public portfolio use.
