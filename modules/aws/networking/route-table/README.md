# AWS Route Table

Path: `modules/aws/networking/route-table`

## Purpose

Reusable AWS Terraform module/example for **Route Table**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "route_table" {
  source = "./modules/aws/networking/route-table"
}
```

## Notes

Keep values generic and safe for public portfolio use.
