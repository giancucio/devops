# Managed Private Endpoint

Deploys a managed private endpoint in Azure Data Factory.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `factoryName` (string) - Existing Data Factory name (default: adf-portfolio)
- `endpointName` (string) - Managed private endpoint name (default: mpe-portfolio)
- `privateLinkResourceId` (string) - Target resource ID (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.Storage/storageAccounts/...)

## Outputs

- `endpointId` (string)

## Example

```bicep
module managedprivateendpoint './main.bicep' = {
  name: 'managed-private-endpoint-deploy'
  params: {
    factoryName: 'adf-portfolio'
    endpointName: 'mpe-portfolio'
    privateLinkResourceId: '/subscriptions/.../resourceGroups/.../providers/Microsoft.Storage/storageAccounts/...'
  }
}
```
