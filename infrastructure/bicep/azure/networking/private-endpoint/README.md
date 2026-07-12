# Private Endpoint

Deploys an Azure Private Endpoint for a private resource connection.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `privateEndpointName` (string) - Private Endpoint name (default: pe-portfolio)
- `location` (string) - Azure location (default: eastus)
- `subnetId` (string) - Subnet resource ID (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/.../subnets/...)
- `privateLinkServiceId` (string) - Private Link service ID (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.Network/privateLinkServices/...)

## Outputs

- `privateEndpointId` (string)

## Example

```bicep
module privateendpoint './main.bicep' = {
  name: 'private-endpoint-deploy'
  params: {
    privateEndpointName: 'pe-portfolio'
    location: 'eastus'
    subnetId: '/subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/.../subnets/...'
    privateLinkServiceId: '/subscriptions/.../resourceGroups/.../providers/Microsoft.Network/privateLinkServices/...'
  }
}
```
