# AWS Iam Policy

Path: `modules/aws/foundation/iam-policy`

## Purpose

Reusable AWS Terraform module/example for **Iam Policy**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "iam_policy" {
  source = "./modules/aws/foundation/iam-policy"
}
```

## Notes

Keep values generic and safe for public portfolio use.
