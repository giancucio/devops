# Service Bus Namespace

Deploys an Azure Service Bus namespace for messaging workloads.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `namespaceName` (string) - Service Bus namespace name (default: sb-portfolio)
- `location` (string) - Azure location (default: eastus)
- `skuName` (string) - Service Bus SKU (default: Standard)

## Outputs

- `namespaceId` (string)

## Example

```bicep
module servicebus './main.bicep' = {
  name: 'service-bus-deploy'
  params: {
    namespaceName: 'sb-portfolio'
    location: 'eastus'
    skuName: 'Standard'
  }
}
```
