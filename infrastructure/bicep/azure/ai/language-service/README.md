# Azure Language Service

Deploys an Azure Language service resource for natural language workloads.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `accountName` (string) - Language service account name (default: langsvc-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `resourceId` (string)

## Example

```bicep
module languageservice './main.bicep' = {
  name: 'language-service-deploy'
  params: {
    accountName: 'langsvc-portfolio'
    location: 'eastus'
  }
}
```
