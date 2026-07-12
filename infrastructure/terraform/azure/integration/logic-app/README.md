# integration/logic-app

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `workflowName` (string) (default: logicapp-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `workflowId` (string)

## Example

```hcl
module "integration_logic-app" {
  source = "../../../../infrastructure/terraform/azure/integration/logic-app"
  # set variables here
}
```
