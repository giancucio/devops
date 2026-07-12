# AWS Ecs Service

Path: `infrastructure/terraform/aws/containers/ecs-service`

## Purpose

Reusable AWS Terraform module/example for **Ecs Service**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "ecs_service" {
  source = "./infrastructure/terraform/aws/containers/ecs-service"
}
```

## Notes

Keep values generic and safe for public portfolio use.
