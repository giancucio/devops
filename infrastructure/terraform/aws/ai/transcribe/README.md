# AWS Transcribe

Path: `infrastructure/terraform/aws/ai/transcribe`

## Purpose

Reusable AWS Terraform module/example for **Transcribe**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "transcribe" {
  source = "./infrastructure/terraform/aws/ai/transcribe"
}
```

## Notes

Keep values generic and safe for public portfolio use.
