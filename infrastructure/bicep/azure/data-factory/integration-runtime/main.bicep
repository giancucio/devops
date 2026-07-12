param factoryName string = 'adf-portfolio'
param integrationRuntimeName string = 'selfhosted'
param location string = 'eastus'

resource resourceModule 'Microsoft.DataFactory/factories/integrationRuntimes@2023-03-01' = {
  name: '${factoryName}/${integrationRuntimeName}'
  location: location
}

output runtimeId string = resourceModule.id
