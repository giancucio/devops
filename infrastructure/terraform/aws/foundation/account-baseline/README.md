# AWS Account Baseline

Path: `infrastructure/terraform/aws/foundation/account-baseline`

## Purpose

Reusable AWS Terraform module/example for **Account Baseline**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "account_baseline" {
  source = "./infrastructure/terraform/aws/foundation/account-baseline"
}
```

## Notes

Keep values generic and safe for public portfolio use.
