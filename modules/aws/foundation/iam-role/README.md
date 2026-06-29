# AWS Iam Role

Path: `modules/aws/foundation/iam-role`

## Purpose

Reusable AWS Terraform module/example for **Iam Role**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "iam_role" {
  source = "./modules/aws/foundation/iam-role"
}
```

## Notes

Keep values generic and safe for public portfolio use.
