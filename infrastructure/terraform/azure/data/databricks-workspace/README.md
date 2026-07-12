# data/databricks-workspace

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `workspaceName` (string) (default: dbws-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `workspaceId` (string)

## Example

```hcl
module "data_databricks-workspace" {
  source = "../../../../infrastructure/terraform/azure/data/databricks-workspace"
  # set variables here
}
```
