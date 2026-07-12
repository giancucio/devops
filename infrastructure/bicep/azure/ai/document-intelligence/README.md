# Document Intelligence

Deploys a Document Intelligence resource for form and document processing.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `accountName` (string) - Document Intelligence account name (default: docintel-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `resourceId` (string)

## Example

```bicep
module documentintelligence './main.bicep' = {
  name: 'document-intelligence-deploy'
  params: {
    accountName: 'docintel-portfolio'
    location: 'eastus'
  }
}
```
