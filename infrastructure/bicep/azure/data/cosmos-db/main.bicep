param accountName string = 'cosmos-portfolio'
param location string = 'eastus'
param databaseName string = 'db1'

resource resourceModule 'Microsoft.DocumentDB/databaseAccounts@2023-03-15' = {
  name: accountName
  location: location
  properties: {
    locations: [{ locationName: 'eastus', failoverPriority: 0 }]
  }
}

output accountId string = resourceModule.id
