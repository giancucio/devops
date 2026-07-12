# Network Security Group

Deploys an Azure Network Security Group.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `nsgName` (string) - NSG name (default: nsg-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `nsgId` (string)

## Example

```bicep
module nsg './main.bicep' = {
  name: 'nsg-deploy'
  params: {
    nsgName: 'nsg-portfolio'
    location: 'eastus'
  }
}
```
