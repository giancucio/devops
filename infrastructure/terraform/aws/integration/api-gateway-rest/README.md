# AWS Api Gateway Rest

Path: `infrastructure/terraform/aws/integration/api-gateway-rest`

## Purpose

Reusable AWS Terraform module/example for **Api Gateway Rest**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "api_gateway_rest" {
  source = "./infrastructure/terraform/aws/integration/api-gateway-rest"
}
```

## Notes

Keep values generic and safe for public portfolio use.
