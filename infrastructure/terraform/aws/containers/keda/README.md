# AWS Keda

Path: `infrastructure/terraform/aws/containers/keda`

## Purpose

Reusable AWS Terraform module/example for **Keda**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "keda" {
  source = "./infrastructure/terraform/aws/containers/keda"
}
```

## Notes

Keep values generic and safe for public portfolio use.
