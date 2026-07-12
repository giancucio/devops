# AWS Opensearch

Path: `infrastructure/terraform/aws/data/opensearch`

## Purpose

Reusable AWS Terraform module/example for **Opensearch**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "opensearch" {
  source = "./infrastructure/terraform/aws/data/opensearch"
}
```

## Notes

Keep values generic and safe for public portfolio use.
