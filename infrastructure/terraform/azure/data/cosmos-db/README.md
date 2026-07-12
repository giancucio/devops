# data/cosmos-db

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `accountName` (string) (default: cosmos-portfolio)
- `location` (string) (default: eastus)
- `databaseName` (string) (default: db1)

## Outputs

- `accountId` (string)

## Example

```hcl
module "data_cosmos-db" {
  source = "../../../../infrastructure/terraform/azure/data/cosmos-db"
  # set variables here
}
```
