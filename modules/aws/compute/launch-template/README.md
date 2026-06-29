# AWS Launch Template

Path: `modules/aws/compute/launch-template`

## Purpose

Reusable AWS Terraform module/example for **Launch Template**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "launch_template" {
  source = "./modules/aws/compute/launch-template"
}
```

## Notes

Keep values generic and safe for public portfolio use.
