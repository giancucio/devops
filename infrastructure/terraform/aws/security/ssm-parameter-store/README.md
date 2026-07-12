# AWS Ssm Parameter Store

Path: `infrastructure/terraform/aws/security/ssm-parameter-store`

## Purpose

Reusable AWS Terraform module/example for **Ssm Parameter Store**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "ssm_parameter_store" {
  source = "./infrastructure/terraform/aws/security/ssm-parameter-store"
}
```

## Notes

Keep values generic and safe for public portfolio use.
