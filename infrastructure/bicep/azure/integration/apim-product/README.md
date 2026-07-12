# API Management Product

Deploys a product in Azure API Management.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `apiManagementName` (string) - Existing API Management service name (default: apim-portfolio)
- `productName` (string) - Product name (default: starter)
- `displayName` (string) - Product display name (default: Starter)

## Outputs

- `productId` (string)

## Example

```bicep
module apimproduct './main.bicep' = {
  name: 'apim-product-deploy'
  params: {
    apiManagementName: 'apim-portfolio'
    productName: 'starter'
    displayName: 'Starter'
  }
}
```
