param factoryName string = 'adf-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.DataFactory/factories@2023-03-01' = {
  name: factoryName
  location: location
}

output factoryId string = resourceModule.id
