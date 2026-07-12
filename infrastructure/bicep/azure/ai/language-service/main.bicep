param accountName string = 'langsvc-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.CognitiveServices/accounts@2021-10-01' = {
  name: accountName
  location: location
  kind: 'LanguageService'
  sku: {
    name: 'S1'
    tier: 'Standard'
  }
  properties: {
    publicNetworkAccess: 'Enabled'
  }
}

output resourceId string = resourceModule.id
