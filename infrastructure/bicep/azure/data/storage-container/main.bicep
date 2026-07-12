param storageAccountName string = 'stgacctportfolio'
param containerName string = 'data'
param location string = 'eastus'

resource resourceModule 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  name: '${storageAccountName}/default/${containerName}'
  location: location
}

output containerId string = resourceModule.id
