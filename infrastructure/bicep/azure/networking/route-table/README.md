# Route Table

Deploys an Azure route table for network routing.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `routeTableName` (string) - Route table name (default: rt-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `routeTableId` (string)

## Example

```bicep
module routetable './main.bicep' = {
  name: 'route-table-deploy'
  params: {
    routeTableName: 'rt-portfolio'
    location: 'eastus'
  }
}
```
