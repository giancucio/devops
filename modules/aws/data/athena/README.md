# AWS Athena

Path: `modules/aws/data/athena`

## Purpose

Reusable AWS Terraform module/example for **Athena**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "athena" {
  source = "./modules/aws/data/athena"
}
```

## Notes

Keep values generic and safe for public portfolio use.
