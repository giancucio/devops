targetScope = 'resourceGroup'

param location string = resourceGroup().location
param accountName string
param skuName string = 'S0'
param tags object = {}

resource account 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: accountName
  location: location
  tags: tags
  sku: {
    name: skuName
  }
  kind: 'OpenAI'
  properties: {
    customSubDomainName: accountName
    publicNetworkAccess: 'Enabled'
  }
}

output accountId string = account.id
output endpoint string = account.properties.endpoint
