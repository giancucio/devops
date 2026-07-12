param storageAccountName string = 'stgacctportfolio'
param location string = 'eastus'
param skuName string = 'Standard_LRS'

resource resourceModule 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
}

output storageAccountId string = resourceModule.id
