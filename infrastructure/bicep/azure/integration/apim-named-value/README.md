# API Management Named Value

Deploys an APIM named value for reusable configuration values.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `apiManagementName` (string) - Existing API Management service name (default: apim-portfolio)
- `namedValueName` (string) - Named value name (default: example-value)
- `value` (string) - Named value secret or string (default: example)

## Outputs

- `namedValueId` (string)

## Example

```bicep
module apimnamedvalue './main.bicep' = {
  name: 'apim-named-value-deploy'
  params: {
    apiManagementName: 'apim-portfolio'
    namedValueName: 'example-value'
    value: 'example'
  }
}
```
