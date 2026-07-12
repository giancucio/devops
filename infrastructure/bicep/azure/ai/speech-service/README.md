# Speech Service

Deploys an Azure Speech service resource for speech-to-text and text-to-speech.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `accountName` (string) - Speech service account name (default: speech-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `serviceId` (string)

## Example

```bicep
module speechservice './main.bicep' = {
  name: 'speech-service-deploy'
  params: {
    accountName: 'speech-portfolio'
    location: 'eastus'
  }
}
```
