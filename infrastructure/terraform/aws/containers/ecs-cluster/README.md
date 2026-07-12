# AWS Ecs Cluster

Path: `infrastructure/terraform/aws/containers/ecs-cluster`

## Purpose

Reusable AWS Terraform module/example for **Ecs Cluster**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "ecs_cluster" {
  source = "./infrastructure/terraform/aws/containers/ecs-cluster"
}
```

## Notes

Keep values generic and safe for public portfolio use.
