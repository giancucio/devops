param routeTableName string = 'rt-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.Network/routeTables@2023-05-01' = {
  name: routeTableName
  location: location
}

output routeTableId string = resourceModule.id
