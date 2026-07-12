# data/postgresql-flexible-server

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `serverName` (string) (default: pgflex-portfolio)
- `location` (string) (default: eastus)
- `administratorLogin` (string) (default: pgadmin)

## Outputs

- `serverId` (string)

## Example

```hcl
module "data_postgresql-flexible-server" {
  source = "../../../../infrastructure/terraform/azure/data/postgresql-flexible-server"
  # set variables here
}
```
