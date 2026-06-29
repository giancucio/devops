# AWS Iam User Group

Path: `modules/aws/foundation/iam-user-group`

## Purpose

Reusable AWS Terraform module/example for **Iam User Group**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "iam_user_group" {
  source = "./modules/aws/foundation/iam-user-group"
}
```

## Notes

Keep values generic and safe for public portfolio use.
