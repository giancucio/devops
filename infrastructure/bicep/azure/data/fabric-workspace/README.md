# Fabric Workspace

Deploys an Azure Fabric workspace for analytics and data workloads.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `workspaceName` (string) - Fabric workspace name (default: fabric-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `workspaceId` (string)

## Example

```bicep
module fabricworkspace './main.bicep' = {
  name: 'fabric-workspace-deploy'
  params: {
    workspaceName: 'fabric-portfolio'
    location: 'eastus'
  }
}
```
