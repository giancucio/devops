# monitoring/action-group

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `actionGroupName` (string) (default: ag-portfolio)
- `shortName` (string) (default: ag)
- `location` (string) (default: global)

## Outputs

- `actionGroupId` (string)

## Example

```hcl
module "monitoring_action-group" {
  source = "../../../../infrastructure/terraform/azure/monitoring/action-group"
  # set variables here
}
```
