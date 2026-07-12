# monitoring/diagnostic-settings

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `resourceId` (string) (default: /subscriptions/.../resourceGroups/.../providers/...)
- `workspaceId` (string) (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.OperationalInsights/workspaces/...)

## Outputs

- `diagnosticSettingsId` (string)

## Example

```hcl
module "monitoring_diagnostic-settings" {
  source = "../../../../infrastructure/terraform/azure/monitoring/diagnostic-settings"
  # set variables here
}
```
