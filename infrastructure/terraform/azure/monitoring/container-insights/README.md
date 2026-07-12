# monitoring/container-insights

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `workspaceName` (string) (default: la-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `workspaceId` (string)

## Example

```hcl
module "monitoring_container-insights" {
  source = "../../../../infrastructure/terraform/azure/monitoring/container-insights"
  # set variables here
}
```
