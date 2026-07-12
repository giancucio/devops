# Key Vault

Deploys an Azure Key Vault with soft delete and access policies.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `keyVaultName` (string) - Key Vault name (default: kv-portfolio)
- `location` (string) - Azure location (default: eastus)
- `tenantId` (string) - Tenant ID (default: 00000000-0000-0000-0000-000000000000)

## Outputs

- `keyVaultId` (string)

## Example

```bicep
module keyvault './main.bicep' = {
  name: 'key-vault-deploy'
  params: {
    keyVaultName: 'kv-portfolio'
    location: 'eastus'
    tenantId: '00000000-0000-0000-0000-000000000000'
  }
}
```
