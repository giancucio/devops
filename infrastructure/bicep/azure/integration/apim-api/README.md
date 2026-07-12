# API Management API

Deploys an API into an existing Azure API Management service.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `apiManagementName` (string) - Existing API Management service name (default: apim-portfolio)
- `apiName` (string) - API name (default: example-api)
- `displayName` (string) - API display name (default: Example API)

## Outputs

- `apiId` (string)

## Example

```bicep
module apimapi './main.bicep' = {
  name: 'apim-api-deploy'
  params: {
    apiManagementName: 'apim-portfolio'
    apiName: 'example-api'
    displayName: 'Example API'
  }
}
```
