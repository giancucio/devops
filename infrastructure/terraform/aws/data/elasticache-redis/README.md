# AWS Elasticache Redis

Path: `infrastructure/terraform/aws/data/elasticache-redis`

## Purpose

Reusable AWS Terraform module/example for **Elasticache Redis**.

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `versions.tf`

## Usage

```hcl
module "elasticache_redis" {
  source = "./infrastructure/terraform/aws/data/elasticache-redis"
}
```

## Notes

Keep values generic and safe for public portfolio use.
