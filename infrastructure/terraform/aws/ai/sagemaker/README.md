# AWS Sagemaker

Path: `infrastructure/terraform/aws/ai/sagemaker`

## Purpose

Reusable AWS Terraform module/example for **Sagemaker**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "sagemaker" {
  source = "./infrastructure/terraform/aws/ai/sagemaker"
}
```

## Notes

Keep values generic and safe for public portfolio use.
