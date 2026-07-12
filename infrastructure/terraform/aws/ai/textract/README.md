# AWS Textract

Path: `infrastructure/terraform/aws/ai/textract`

## Purpose

Reusable AWS Terraform module/example for **Textract**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "textract" {
  source = "./infrastructure/terraform/aws/ai/textract"
}
```

## Notes

Keep values generic and safe for public portfolio use.
