# App Service Plan

Deploys an Azure App Service plan for web apps and functions.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `planName` (string) - App Service plan name (default: asp-portfolio)
- `location` (string) - Azure location (default: eastus)
- `skuName` (string) - App Service plan SKU (default: P1v2)

## Outputs

- `planId` (string)

## Example

```bicep
module appserviceplan './main.bicep' = {
  name: 'app-service-plan-deploy'
  params: {
    planName: 'asp-portfolio'
    location: 'eastus'
    skuName: 'P1v2'
  }
}
```
