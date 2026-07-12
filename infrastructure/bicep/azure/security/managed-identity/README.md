# Managed Identity

Deploys a user-assigned managed identity.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `identityName` (string) - Managed identity name (default: identity-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `identityId` (string)

## Example

```bicep
module managedidentity './main.bicep' = {
  name: 'managed-identity-deploy'
  params: {
    identityName: 'identity-portfolio'
    location: 'eastus'
  }
}
```
