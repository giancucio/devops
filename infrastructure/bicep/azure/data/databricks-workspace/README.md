# Databricks Workspace

Deploys an Azure Databricks workspace.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `workspaceName` (string) - Databricks workspace name (default: dbws-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `workspaceId` (string)

## Example

```bicep
module databricksworkspace './main.bicep' = {
  name: 'databricks-workspace-deploy'
  params: {
    workspaceName: 'dbws-portfolio'
    location: 'eastus'
  }
}
```
