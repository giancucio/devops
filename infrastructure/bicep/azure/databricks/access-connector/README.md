# Databricks Access Connector

Deploys a Databricks access connector for secure private connectivity.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `workspaceName` (string) - Existing Databricks workspace name (default: databricks-portfolio)
- `connectorName` (string) - Access connector name (default: access-connector)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `connectorId` (string)

## Example

```bicep
module accessconnector './main.bicep' = {
  name: 'access-connector-deploy'
  params: {
    workspaceName: 'databricks-portfolio'
    connectorName: 'access-connector'
    location: 'eastus'
  }
}
```
