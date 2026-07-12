# data/storage-container

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `storageAccountName` (string) (default: stgacctportfolio)
- `containerName` (string) (default: data)
- `location` (string) (default: eastus)

## Outputs

- `containerId` (string)

## Example

```hcl
module "data_storage-container" {
  source = "../../../../infrastructure/terraform/azure/data/storage-container"
  # set variables here
}
```
