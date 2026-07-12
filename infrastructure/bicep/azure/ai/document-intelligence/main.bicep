param accountName string = 'docintel-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.CognitiveServices/accounts@2021-10-01' = {
  name: accountName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
    tier: 'Standard'
  }
  properties: {
    publicNetworkAccess: 'Enabled'
  }
}

output resourceId string = resourceModule.id
