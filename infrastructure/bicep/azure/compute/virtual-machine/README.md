# Virtual Machine

Deploys an Azure Virtual Machine.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `vmName` (string) - Virtual machine name (default: vm-portfolio)
- `location` (string) - Azure location (default: eastus)
- `vmSize` (string) - VM size (default: Standard_DS1_v2)
- `adminUsername` (string) - Administrator username (default: azureuser)

## Outputs

- `vmId` (string)

## Example

```bicep
module virtualmachine './main.bicep' = {
  name: 'virtual-machine-deploy'
  params: {
    vmName: 'vm-portfolio'
    location: 'eastus'
    vmSize: 'Standard_DS1_v2'
    adminUsername: 'azureuser'
  }
}
```
