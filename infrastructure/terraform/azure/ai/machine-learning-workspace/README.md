# ai/machine-learning-workspace

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `workspaceName` (string) (default: mlws-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `workspaceId` (string)

## Example

```hcl
module "ai_machine-learning-workspace" {
  source = "../../../../infrastructure/terraform/azure/ai/machine-learning-workspace"
  # set variables here
}
```
