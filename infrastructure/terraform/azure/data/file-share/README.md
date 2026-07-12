# data/file-share

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `storageAccountName` (string) (default: stgacctportfolio)
- `shareName` (string) (default: fileshare)
- `location` (string) (default: eastus)

## Outputs

- `shareId` (string)

## Example

```hcl
module "data_file-share" {
  source = "../../../../infrastructure/terraform/azure/data/file-share"
  # set variables here
}
```
