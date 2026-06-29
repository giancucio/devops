targetScope = 'resourceGroup'

param location string = resourceGroup().location
param routeTableName string
param tags object = {}

resource routeTable 'Microsoft.Network/routeTables@2023-09-01' = {
  name: routeTableName
  location: location
  tags: tags
  properties: {
    disableBgpRoutePropagation: false
    routes: []
  }
}

output routeTableId string = routeTable.id
