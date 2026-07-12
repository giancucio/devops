param accountName string = 'speech-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.CognitiveServices/accounts@2021-10-01' = {
  name: accountName
  location: location
  properties: {
    kind: 'SpeechServices'
    properties: {
      publicNetworkAccess: 'Enabled'
    }
  }
}

output serviceId string = resourceModule.id
