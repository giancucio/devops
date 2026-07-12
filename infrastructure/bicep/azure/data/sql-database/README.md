# SQL Database

Deploys an Azure SQL Database in a SQL server.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `sqlServerName` (string) - Existing SQL server name (default: sqlserverportfolio)
- `databaseName` (string) - SQL database name (default: sqldb)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `databaseId` (string)

## Example

```bicep
module sqldatabase './main.bicep' = {
  name: 'sql-database-deploy'
  params: {
    sqlServerName: 'sqlserverportfolio'
    databaseName: 'sqldb'
    location: 'eastus'
  }
}
```
