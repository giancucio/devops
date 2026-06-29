# AWS Ecs Task Definition

Path: `modules/aws/containers/ecs-task-definition`

## Purpose

Reusable AWS Terraform module/example for **Ecs Task Definition**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "ecs_task_definition" {
  source = "./modules/aws/containers/ecs-task-definition"
}
```

## Notes

Keep values generic and safe for public portfolio use.
