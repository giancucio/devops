# NAT Gateway

Deploys an Azure NAT Gateway for outbound connectivity.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `natGatewayName` (string) - NAT Gateway name (default: natgw-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `natGatewayId` (string)

## Example

```bicep
module natgateway './main.bicep' = {
  name: 'nat-gateway-deploy'
  params: {
    natGatewayName: 'natgw-portfolio'
    location: 'eastus'
  }
}
```
