# AWS Guardduty

Path: `infrastructure/terraform/aws/security/guardduty`

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
  source = "./infrastructure/terraform/aws/security/guardduty"
}
```

## Notes

Keep values generic and safe for public portfolio use.
