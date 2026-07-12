# AWS Bedrock

Path: `infrastructure/terraform/aws/ai/bedrock`

## Purpose

Reusable AWS Terraform module/example for **Bedrock**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "bedrock" {
  source = "./infrastructure/terraform/aws/ai/bedrock"
}
```

## Notes

Keep values generic and safe for public portfolio use.
