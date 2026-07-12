# AWS Api Gateway Http

Path: `infrastructure/terraform/aws/integration/api-gateway-http`

## Purpose

Reusable AWS Terraform module/example for **Api Gateway Http**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "api_gateway_http" {
  source = "./infrastructure/terraform/aws/integration/api-gateway-http"
}
```

## Notes

Keep values generic and safe for public portfolio use.
