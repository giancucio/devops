# Storage Container

Deploys a blob container inside an existing Storage account.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `storageAccountName` (string) - Storage account name (default: stgacctportfolio)
- `containerName` (string) - Blob container name (default: data)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `containerId` (string)

## Example

```bicep
module storagecontainer './main.bicep' = {
  name: 'storage-container-deploy'
  params: {
    storageAccountName: 'stgacctportfolio'
    containerName: 'data'
    location: 'eastus'
  }
}
```
