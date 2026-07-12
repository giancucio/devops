# Storage File Share

Deploys a file share inside an existing Storage account.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `storageAccountName` (string) - Storage account name (default: stgacctportfolio)
- `shareName` (string) - File share name (default: fileshare)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `shareId` (string)

## Example

```bicep
module fileshare './main.bicep' = {
  name: 'file-share-deploy'
  params: {
    storageAccountName: 'stgacctportfolio'
    shareName: 'fileshare'
    location: 'eastus'
  }
}
```
