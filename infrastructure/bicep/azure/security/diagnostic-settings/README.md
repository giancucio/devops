# Security Diagnostic Settings

Deploys diagnostic settings for a security resource.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `resourceId` (string) - Target resource ID (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.KeyVault/vaults/...)
- `workspaceId` (string) - Log Analytics workspace ID (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.OperationalInsights/workspaces/...)

## Outputs

- `settingsId` (string)

## Example

```bicep
module diagnosticsettings './main.bicep' = {
  name: 'diagnostic-settings-deploy'
  params: {
    resourceId: '/subscriptions/.../resourceGroups/.../providers/Microsoft.KeyVault/vaults/...'
    workspaceId: '/subscriptions/.../resourceGroups/.../providers/Microsoft.OperationalInsights/workspaces/...'
  }
}
```
