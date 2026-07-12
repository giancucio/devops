# Integration Runtime

Deploys an Azure Data Factory integration runtime.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `factoryName` (string) - Existing Data Factory name (default: adf-portfolio)
- `integrationRuntimeName` (string) - Integration Runtime name (default: selfhosted)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `runtimeId` (string)

## Example

```bicep
module integrationruntime './main.bicep' = {
  name: 'integration-runtime-deploy'
  params: {
    factoryName: 'adf-portfolio'
    integrationRuntimeName: 'selfhosted'
    location: 'eastus'
  }
}
```
