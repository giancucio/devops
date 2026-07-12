# Application Gateway

Deploys an Azure Application Gateway.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `gatewayName` (string) - Application Gateway name (default: appgw-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `gatewayId` (string)

## Example

```bicep
module applicationgateway './main.bicep' = {
  name: 'application-gateway-deploy'
  params: {
    gatewayName: 'appgw-portfolio'
    location: 'eastus'
  }
}
```
