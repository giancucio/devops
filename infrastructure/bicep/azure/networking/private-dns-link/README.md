# Private DNS Zone Virtual Network Link

Deploys a virtual network link for a Private DNS zone.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `zoneName` (string) - Private DNS zone name (default: privatelinkzone)
- `linkName` (string) - Virtual network link name (default: vnet-link)
- `virtualNetworkId` (string) - Virtual network resource ID (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/...)

## Outputs

- `linkId` (string)

## Example

```bicep
module privatednslink './main.bicep' = {
  name: 'private-dns-link-deploy'
  params: {
    zoneName: 'privatelinkzone'
    linkName: 'vnet-link'
    virtualNetworkId: '/subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/...'
  }
}
```
