targetScope = 'resourceGroup'

param storageAccountName string
param shareName string = 'files'
param shareQuota int = 100

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: storageAccountName
}

resource share 'Microsoft.Storage/storageAccounts/fileServices/shares@2023-01-01' = {
  name: '${storage.name}/default/${shareName}'
  properties: {
    shareQuota: shareQuota
  }
}

output fileShareId string = share.id
