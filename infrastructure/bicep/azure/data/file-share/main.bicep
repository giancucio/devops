param storageAccountName string = 'stgacctportfolio'
param shareName string = 'fileshare'
param location string = 'eastus'

resource resourceModule 'Microsoft.Storage/storageAccounts/fileServices/shares@2022-09-01' = {
  name: '${storageAccountName}/default/${shareName}'
  location: location
}

output shareId string = resourceModule.id
