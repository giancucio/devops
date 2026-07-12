# Action Group

Deploys an Azure Monitor action group for alert notifications.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `actionGroupName` (string) - Action Group name (default: ag-portfolio)
- `shortName` (string) - Action Group short name (default: ag)
- `location` (string) - Resource location (usually global) (default: global)

## Outputs

- `actionGroupId` (string)

## Example

```bicep
module actiongroup './main.bicep' = {
  name: 'action-group-deploy'
  params: {
    actionGroupName: 'ag-portfolio'
    shortName: 'ag'
    location: 'global'
  }
}
```
