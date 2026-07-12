# Event Hubs Namespace

Deploys an Azure Event Hubs namespace.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `namespaceName` (string) - Event Hubs namespace name (default: eventhub-namespace)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `namespaceId` (string)

## Example

```bicep
module eventhub './main.bicep' = {
  name: 'event-hub-deploy'
  params: {
    namespaceName: 'eventhub-namespace'
    location: 'eastus'
  }
}
```
