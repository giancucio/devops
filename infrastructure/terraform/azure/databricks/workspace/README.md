# databricks/workspace

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `workspaceName` (string) (default: databricks-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `workspaceId` (string)

## Example

```hcl
module "databricks_workspace" {
  source = "../../../../infrastructure/terraform/azure/databricks/workspace"
  # set variables here
}
```
