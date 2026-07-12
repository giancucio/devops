# ai/ai-search

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `searchServiceName` (string) (default: search-portfolio)
- `location` (string) (default: eastus)
- `skuName` (string) (default: standard)
- `replicaCount` (int) (default: 1)
- `partitionCount` (int) (default: 1)

## Outputs

- `searchServiceId` (string)

## Example

```hcl
module "ai_ai-search" {
  source = "../../../../infrastructure/terraform/azure/ai/ai-search"
  # set variables here
}
```
