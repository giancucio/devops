param serverName string = 'pgflex-portfolio'
param location string = 'eastus'
param administratorLogin string = 'pgadmin'

resource resourceModule 'Microsoft.DBForPostgreSQL/flexibleServers@2023-03-01-preview' = {
  name: serverName
  location: location
}

output serverId string = resourceModule.id
