# Subnet

Deploys a subnet within an existing virtual network.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `vnetName` (string) - Existing virtual network name (default: vnet-portfolio)
- `subnetName` (string) - Subnet name (default: subnet1)
- `addressPrefix` (string) - Subnet address prefix (default: 10.0.1.0/24)

## Outputs

- `subnetId` (string)

## Example

```bicep
module subnet './main.bicep' = {
  name: 'subnet-deploy'
  params: {
    vnetName: 'vnet-portfolio'
    subnetName: 'subnet1'
    addressPrefix: '10.0.1.0/24'
  }
}
```
