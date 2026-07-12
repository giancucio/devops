# security/diagnostic-settings

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `resourceId` (string) (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.KeyVault/vaults/...)
- `workspaceId` (string) (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.OperationalInsights/workspaces/...)

## Outputs

- `settingsId` (string)

## Example

```hcl
module "security_diagnostic-settings" {
  source = "../../../../infrastructure/terraform/azure/security/diagnostic-settings"
  # set variables here
}
```
