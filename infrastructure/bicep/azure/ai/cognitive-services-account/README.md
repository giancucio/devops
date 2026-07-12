# Cognitive Services Account

Deploys an Azure Cognitive Services account for AI workloads.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `accountName` (string) - Cognitive Services account name (default: cogsvc-portfolio)
- `location` (string) - Azure location (default: eastus)
- `skuName` (string) - SKU name (default: S0)

## Outputs

- `accountId` (string)

## Example

```bicep
module cognitiveservicesaccount './main.bicep' = {
  name: 'cognitive-services-account-deploy'
  params: {
    accountName: 'cogsvc-portfolio'
    location: 'eastus'
    skuName: 'S0'
  }
}
```
