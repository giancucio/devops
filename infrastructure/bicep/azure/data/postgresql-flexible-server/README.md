# PostgreSQL Flexible Server

Deploys an Azure Database for PostgreSQL flexible server.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `serverName` (string) - PostgreSQL server name (default: pgflex-portfolio)
- `location` (string) - Azure location (default: eastus)
- `administratorLogin` (string) - Administrator login (default: pgadmin)

## Outputs

- `serverId` (string)

## Example

```bicep
module postgresqlflexibleserver './main.bicep' = {
  name: 'postgresql-flexible-server-deploy'
  params: {
    serverName: 'pgflex-portfolio'
    location: 'eastus'
    administratorLogin: 'pgadmin'
  }
}
```
