param accountName string = 'openai-portfolio'
param location string = 'eastus'
param skuName string = 'S0'

resource resourceModule 'Microsoft.CognitiveServices/accounts@2021-10-01' = {
  name: accountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
    tier: 'Standard'
  }
  properties: {
    publicNetworkAccess: 'Enabled'
  }
}

output accountId string = resourceModule.id
