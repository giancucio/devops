# AWS Service Control Policy

Path: `infrastructure/terraform/aws/foundation/service-control-policy`

## Purpose

Reusable AWS Terraform module/example for **Service Control Policy**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "service_control_policy" {
  source = "./infrastructure/terraform/aws/foundation/service-control-policy"
}
```

## Notes

Keep values generic and safe for public portfolio use.
