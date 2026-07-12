# API Management Service

Deploys an Azure API Management service instance.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `serviceName` (string) - API Management service name (default: apim-portfolio)
- `location` (string) - Azure location (default: eastus)
- `publisherEmail` (string) - Publisher email (default: admin@example.com)
- `publisherName` (string) - Publisher name (default: Contoso)

## Outputs

- `serviceId` (string)

## Example

```bicep
module apimanagement './main.bicep' = {
  name: 'api-management-deploy'
  params: {
    serviceName: 'apim-portfolio'
    location: 'eastus'
    publisherEmail: 'admin@example.com'
    publisherName: 'Contoso'
  }
}
```
