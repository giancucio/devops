# Private Link Service

Deploys an Azure Private Link Service for private connectivity.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `serviceName` (string) - Private Link Service name (default: pls-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `serviceId` (string)

## Example

```bicep
module privatelink './main.bicep' = {
  name: 'private-link-deploy'
  params: {
    serviceName: 'pls-portfolio'
    location: 'eastus'
  }
}
```
