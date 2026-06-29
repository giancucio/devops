# AWS Autoscaling Group

Path: `modules/aws/compute/autoscaling-group`

## Purpose

Reusable AWS Terraform module/example for **Autoscaling Group**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "autoscaling_group" {
  source = "./modules/aws/compute/autoscaling-group"
}
```

## Notes

Keep values generic and safe for public portfolio use.
