# AWS Fargate Service

Path: `infrastructure/terraform/aws/containers/fargate-service`

## Purpose

Reusable AWS Terraform module/example for **Fargate Service**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "fargate_service" {
  source = "./infrastructure/terraform/aws/containers/fargate-service"
}
```

## Notes

Keep values generic and safe for public portfolio use.
