# Function App

Deploys an Azure Function App for serverless workloads.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `functionName` (string) - Function App name (default: func-portfolio)
- `location` (string) - Azure location (default: eastus)
- `servicePlanId` (string) - App Service plan resource ID (default: service-plan-id)

## Outputs

- `functionId` (string)

## Example

```bicep
module functionapp './main.bicep' = {
  name: 'function-app-deploy'
  params: {
    functionName: 'func-portfolio'
    location: 'eastus'
    servicePlanId: 'service-plan-id'
  }
}
```
