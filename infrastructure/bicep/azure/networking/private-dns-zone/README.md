# Private DNS Zone

Deploys an Azure Private DNS zone.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `zoneName` (string) - Private DNS zone name (default: privatelinkzone)
- `location` (string) - Resource location (default: global)

## Outputs

- `zoneId` (string)

## Example

```bicep
module privatednszone './main.bicep' = {
  name: 'private-dns-zone-deploy'
  params: {
    zoneName: 'privatelinkzone'
    location: 'global'
  }
}
```
