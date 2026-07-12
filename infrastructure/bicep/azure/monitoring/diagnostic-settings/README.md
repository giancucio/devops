# Diagnostic Settings

Deploys diagnostic settings for resource logs.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `resourceId` (string) - Target resource ID (default: /subscriptions/.../resourceGroups/.../providers/...)
- `workspaceId` (string) - Log Analytics workspace ID (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.OperationalInsights/workspaces/...)

## Outputs

- `diagnosticSettingsId` (string)

## Example

```bicep
module diagnosticsettings './main.bicep' = {
  name: 'diagnostic-settings-deploy'
  params: {
    resourceId: '/subscriptions/.../resourceGroups/.../providers/...'
    workspaceId: '/subscriptions/.../resourceGroups/.../providers/Microsoft.OperationalInsights/workspaces/...'
  }
}
```
