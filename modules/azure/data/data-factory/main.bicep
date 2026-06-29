targetScope = 'resourceGroup'

param location string = resourceGroup().location
param dataFactoryName string
param tags object = {}

resource adf 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  tags: tags
  identity: {
    type: 'SystemAssigned'
  }
}

output dataFactoryId string = adf.id
output principalId string = adf.identity.principalId
