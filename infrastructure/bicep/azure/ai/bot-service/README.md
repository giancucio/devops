# Azure Bot Service

Deploys an Azure Bot Service resource for conversational applications.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `botName` (string) - Bot service name (default: bot-portfolio)
- `location` (string) - Azure location (default: eastus)
- `appId` (string) - Application (client) ID for the bot

## Outputs

- `botId` (string)

## Example

```bicep
module botservice './main.bicep' = {
  name: 'bot-service-deploy'
  params: {
    botName: 'bot-portfolio'
    location: 'eastus'
    appId: 'appId-value'
  }
}
```
