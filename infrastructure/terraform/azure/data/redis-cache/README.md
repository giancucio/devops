# data/redis-cache

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `redisName` (string) (default: redis-portfolio)
- `location` (string) (default: eastus)
- `skuName` (string) (default: Standard)

## Outputs

- `redisId` (string)

## Example

```hcl
module "data_redis-cache" {
  source = "../../../../infrastructure/terraform/azure/data/redis-cache"
  # set variables here
}
```
