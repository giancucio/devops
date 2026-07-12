# Storage Account

Deploys an Azure Storage account.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `storageAccountName` (string) - Storage account name (default: stgacctportfolio)
- `location` (string) - Azure location (default: eastus)
- `skuName` (string) - Storage SKU (default: Standard_LRS)

## Outputs

- `storageAccountId` (string)

## Example

```bicep
module storageaccount './main.bicep' = {
  name: 'storage-account-deploy'
  params: {
    storageAccountName: 'stgacctportfolio'
    location: 'eastus'
    skuName: 'Standard_LRS'
  }
}
```
