# Event Grid Topic

Deploys an Azure Event Grid topic for event publishing.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `topicName` (string) - Event Grid topic name (default: eventgrid-topic)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `topicId` (string)

## Example

```bicep
module eventgrid './main.bicep' = {
  name: 'event-grid-deploy'
  params: {
    topicName: 'eventgrid-topic'
    location: 'eastus'
  }
}
```
