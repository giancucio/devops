# Resource Group

Deploys a new Azure resource group.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `resourceGroupName` (string) - Resource group name (default: rg-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `resourceGroupId` (string)

## Example

```bicep
module resourcegroup './main.bicep' = {
  name: 'resource-group-deploy'
  params: {
    resourceGroupName: 'rg-portfolio'
    location: 'eastus'
  }
}
```
