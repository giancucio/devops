# Container Insights

Deploys a Log Analytics workspace for Azure Monitor Container Insights.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `workspaceName` (string) - Log Analytics workspace name (default: la-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `workspaceId` (string)

## Example

```bicep
module containerinsights './main.bicep' = {
  name: 'container-insights-deploy'
  params: {
    workspaceName: 'la-portfolio'
    location: 'eastus'
  }
}
```
