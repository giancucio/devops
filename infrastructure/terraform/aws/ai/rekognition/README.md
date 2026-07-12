# AWS Rekognition

Path: `infrastructure/terraform/aws/ai/rekognition`

## Purpose

Reusable AWS Terraform module/example for **Rekognition**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "rekognition" {
  source = "./infrastructure/terraform/aws/ai/rekognition"
}
```

## Notes

Keep values generic and safe for public portfolio use.
