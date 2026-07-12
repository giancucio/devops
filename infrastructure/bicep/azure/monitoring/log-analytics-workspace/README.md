# Log Analytics Workspace

Deploys an Azure Log Analytics workspace.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `workspaceName` (string) - Log Analytics workspace name (default: laworkspace-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `workspaceId` (string)

## Example

```bicep
module loganalyticsworkspace './main.bicep' = {
  name: 'log-analytics-workspace-deploy'
  params: {
    workspaceName: 'laworkspace-portfolio'
    location: 'eastus'
  }
}
```
