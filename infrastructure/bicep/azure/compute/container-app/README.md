# Container App

Deploys an Azure Container App for containerized workloads.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `containerAppName` (string) - Container App name (default: ca-portfolio)
- `location` (string) - Azure location (default: eastus)
- `environmentId` (string) - Container Apps environment resource ID (default: container-app-env-id)

## Outputs

- `containerAppId` (string)

## Example

```bicep
module containerapp './main.bicep' = {
  name: 'container-app-deploy'
  params: {
    containerAppName: 'ca-portfolio'
    location: 'eastus'
    environmentId: 'container-app-env-id'
  }
}
```
