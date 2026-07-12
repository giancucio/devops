# Cosmos DB Account

Deploys an Azure Cosmos DB account for globally distributed data storage.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `accountName` (string) - Cosmos DB account name (default: cosmos-portfolio)
- `location` (string) - Azure location (default: eastus)
- `databaseName` (string) - Initial database name (default: db1)

## Outputs

- `accountId` (string)

## Example

```bicep
module cosmosdb './main.bicep' = {
  name: 'cosmos-db-deploy'
  params: {
    accountName: 'cosmos-portfolio'
    location: 'eastus'
    databaseName: 'db1'
  }
}
```
