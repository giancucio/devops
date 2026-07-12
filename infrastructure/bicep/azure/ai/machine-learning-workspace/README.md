# Machine Learning Workspace

Deploys an Azure Machine Learning workspace for ML development and training.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `workspaceName` (string) - ML workspace name (default: mlws-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `workspaceId` (string)

## Example

```bicep
module machinelearningworkspace './main.bicep' = {
  name: 'machine-learning-workspace-deploy'
  params: {
    workspaceName: 'mlws-portfolio'
    location: 'eastus'
  }
}
```
