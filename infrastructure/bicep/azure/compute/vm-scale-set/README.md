# Virtual Machine Scale Set

Deploys an Azure Virtual Machine Scale Set.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `vmssName` (string) - Scale set name (default: vmss-portfolio)
- `location` (string) - Azure location (default: eastus)
- `instanceCount` (int) - Scale set instance count (default: 2)

## Outputs

- `vmssId` (string)

## Example

```bicep
module vmscaleset './main.bicep' = {
  name: 'vm-scale-set-deploy'
  params: {
    vmssName: 'vmss-portfolio'
    location: 'eastus'
    instanceCount: 2
  }
}
```
