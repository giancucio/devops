# App Service

Deploys an Azure App Service web app.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `appName` (string) - App Service name (default: app-portfolio)
- `location` (string) - Azure location (default: eastus)
- `servicePlanId` (string) - App Service plan resource ID (default: service-plan-id)

## Outputs

- `appId` (string)

## Example

```bicep
module appservice './main.bicep' = {
  name: 'app-service-deploy'
  params: {
    appName: 'app-portfolio'
    location: 'eastus'
    servicePlanId: 'service-plan-id'
  }
}
```
