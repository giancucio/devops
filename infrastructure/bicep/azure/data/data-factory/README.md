# Data Factory

Deploys an Azure Data Factory instance.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `factoryName` (string) - Data Factory name (default: adf-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `factoryId` (string)

## Example

```bicep
module datafactory './main.bicep' = {
  name: 'data-factory-deploy'
  params: {
    factoryName: 'adf-portfolio'
    location: 'eastus'
  }
}
```
