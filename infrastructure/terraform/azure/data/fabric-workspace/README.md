# data/fabric-workspace

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `workspaceName` (string) (default: fabric-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `workspaceId` (string)

## Example

```hcl
module "data_fabric-workspace" {
  source = "../../../../infrastructure/terraform/azure/data/fabric-workspace"
  # set variables here
}
```
