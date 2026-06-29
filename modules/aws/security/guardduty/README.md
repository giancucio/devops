# AWS Guardduty

Path: `modules/aws/security/guardduty`

## Purpose

Reusable AWS Terraform module/example for **Guardduty**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "guardduty" {
  source = "./modules/aws/security/guardduty"
}
```

## Notes

Keep values generic and safe for public portfolio use.
