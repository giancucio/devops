# API Management Policy

Deploys an APIM policy at service scope.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `apiManagementName` (string) - Existing API Management service name (default: apim-portfolio)
- `policyContent` (string) - APIM policy XML content (default: <policies></policies>)

## Outputs

- `policyId` (string)

## Example

```bicep
module apimpolicy './main.bicep' = {
  name: 'apim-policy-deploy'
  params: {
    apiManagementName: 'apim-portfolio'
    policyContent: '<policies></policies>'
  }
}
```
