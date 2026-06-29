targetScope = 'resourceGroup'

param location string = resourceGroup().location
param sqlServerName string
param databaseName string
param adminLogin string
@secure()
param adminPassword string
param tags object = {}

resource server 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: sqlServerName
  location: location
  tags: tags
  properties: {
    administratorLogin: adminLogin
    administratorLoginPassword: adminPassword
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Enabled'
  }
}

resource database 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  parent: server
  name: databaseName
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
}

output databaseId string = database.id
