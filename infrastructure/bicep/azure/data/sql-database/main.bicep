param sqlServerName string = 'sqlserverportfolio'
param databaseName string = 'sqldb'
param location string = 'eastus'

resource resourceModule 'Microsoft.Sql/servers/databases@2022-02-01-preview' = {
  name: '${sqlServerName}/${databaseName}'
  location: location
}

output databaseId string = resourceModule.id
