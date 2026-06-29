# AWS Ec2

Path: `modules/aws/compute/ec2`

## Purpose

Reusable AWS Terraform module/example for **Ec2**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "ec2" {
  source = "./modules/aws/compute/ec2"
}
```

## Notes

Keep values generic and safe for public portfolio use.
