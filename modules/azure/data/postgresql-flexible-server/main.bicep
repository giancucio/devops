targetScope = 'resourceGroup'

param location string = resourceGroup().location
param serverName string
param adminLogin string
@secure()
param adminPassword string
param tags object = {}

resource server 'Microsoft.DBforPostgreSQL/flexibleServers@2023-03-01-preview' = {
  name: serverName
  location: location
  tags: tags
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    version: '15'
    administratorLogin: adminLogin
    administratorLoginPassword: adminPassword
    storage: {
      storageSizeGB: 32
    }
  }
}

output serverId string = server.id
output fqdn string = server.properties.fullyQualifiedDomainName
