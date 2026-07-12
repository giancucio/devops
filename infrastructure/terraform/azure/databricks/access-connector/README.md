# databricks/access-connector

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `workspaceName` (string) (default: databricks-portfolio)
- `connectorName` (string) (default: access-connector)
- `location` (string) (default: eastus)

## Outputs

- `connectorId` (string)

## Example

```hcl
module "databricks_access-connector" {
  source = "../../../../infrastructure/terraform/azure/databricks/access-connector"
  # set variables here
}
```
