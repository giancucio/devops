# User Assigned Managed Identity

Deploys a user-assigned managed identity.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `identityName` (string) - Managed identity name (default: uami-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `identityId` (string)

## Example

```bicep
module userassignedmanagedidentity './main.bicep' = {
  name: 'user-assigned-managed-identity-deploy'
  params: {
    identityName: 'uami-portfolio'
    location: 'eastus'
  }
}
```
