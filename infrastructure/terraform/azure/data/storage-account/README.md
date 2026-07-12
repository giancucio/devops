# data/storage-account

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `storageAccountName` (string) (default: stgacctportfolio)
- `location` (string) (default: eastus)
- `skuName` (string) (default: Standard_LRS)

## Outputs

- `storageAccountId` (string)

## Example

```hcl
module "data_storage-account" {
  source = "../../../../infrastructure/terraform/azure/data/storage-account"
  # set variables here
}
```
