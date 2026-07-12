# API Management Backend

Deploys an APIM backend for API configuration.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `apiManagementName` (string) - Existing API Management service name (default: apim-portfolio)
- `backendName` (string) - Backend name (default: backend-portfolio)
- `backendUrl` (string) - Backend URL (default: https://example.com)

## Outputs

- `backendId` (string)

## Example

```bicep
module apimbackend './main.bicep' = {
  name: 'apim-backend-deploy'
  params: {
    apiManagementName: 'apim-portfolio'
    backendName: 'backend-portfolio'
    backendUrl: 'https://example.com'
  }
}
```
