# data-factory/managed-private-endpoint

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `factoryName` (string) (default: adf-portfolio)
- `endpointName` (string) (default: mpe-portfolio)
- `privateLinkResourceId` (string) (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.Storage/storageAccounts/...)

## Outputs

- `endpointId` (string)

## Example

```hcl
module "data-factory_managed-private-endpoint" {
  source = "../../../../infrastructure/terraform/azure/data-factory/managed-private-endpoint"
  # set variables here
}
```
