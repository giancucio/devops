# AWS Alb

Path: `modules/aws/networking/alb`

## Purpose

Reusable AWS Terraform module/example for **Alb**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "alb" {
  source = "./modules/aws/networking/alb"
}
```

## Notes

Keep values generic and safe for public portfolio use.
