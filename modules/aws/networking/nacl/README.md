# AWS Nacl

Path: `modules/aws/networking/nacl`

## Purpose

Reusable AWS Terraform module/example for **Nacl**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "nacl" {
  source = "./modules/aws/networking/nacl"
}
```

## Notes

Keep values generic and safe for public portfolio use.
