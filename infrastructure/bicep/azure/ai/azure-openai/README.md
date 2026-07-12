# Azure OpenAI Service

Deploys an Azure OpenAI resource for generative AI workloads.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `accountName` (string) - OpenAI account name (default: openai-portfolio)
- `location` (string) - Azure location (default: eastus)
- `skuName` (string) - Service SKU (default: S0)

## Outputs

- `accountId` (string)

## Example

```bicep
module azureopenai './main.bicep' = {
  name: 'azure-openai-deploy'
  params: {
    accountName: 'openai-portfolio'
    location: 'eastus'
    skuName: 'S0'
  }
}
```
