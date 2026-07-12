# Virtual Network

Deploys an Azure virtual network with address space.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `vnetName` (string) - Virtual network name (default: vnet-portfolio)
- `location` (string) - Azure location (default: eastus)
- `addressPrefix` (string) - VNet address prefix (default: 10.0.0.0/16)

## Outputs

- `vnetId` (string)

## Example

```bicep
module vnet './main.bicep' = {
  name: 'vnet-deploy'
  params: {
    vnetName: 'vnet-portfolio'
    location: 'eastus'
    addressPrefix: '10.0.0.0/16'
  }
}
```
