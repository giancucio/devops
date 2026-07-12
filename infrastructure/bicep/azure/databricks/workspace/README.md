# Databricks Workspace

Deploys an Azure Databricks workspace for analytics and notebooks.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `workspaceName` (string) - Databricks workspace name (default: databricks-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `workspaceId` (string)

## Example

```bicep
module workspace './main.bicep' = {
  name: 'workspace-deploy'
  params: {
    workspaceName: 'databricks-portfolio'
    location: 'eastus'
  }
}
```
