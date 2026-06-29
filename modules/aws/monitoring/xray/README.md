# AWS Xray

Path: `modules/aws/monitoring/xray`

## Purpose

Reusable AWS Terraform module/example for **Xray**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "xray" {
  source = "./modules/aws/monitoring/xray"
}
```

## Notes

Keep values generic and safe for public portfolio use.
