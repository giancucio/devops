# data/sql-database

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `sqlServerName` (string) (default: sqlserverportfolio)
- `databaseName` (string) (default: sqldb)
- `location` (string) (default: eastus)

## Outputs

- `databaseId` (string)

## Example

```hcl
module "data_sql-database" {
  source = "../../../../infrastructure/terraform/azure/data/sql-database"
  # set variables here
}
```
