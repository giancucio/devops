param location string = 'eastus'
param factoryName string = 'adf-portfolio'
param endpointName string = 'mpe-portfolio'
param privateLinkResourceId string = '/subscriptions/.../resourceGroups/.../providers/Microsoft.Storage/storageAccounts/...'

resource resourceModule 'Microsoft.DataFactory/factories/managedPrivateEndpoints@2023-03-01' = {
  name: '${factoryName}/${endpointName}'
  location: location
}

output endpointId string = resourceModule.id
