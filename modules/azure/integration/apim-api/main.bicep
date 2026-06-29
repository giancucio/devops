targetScope = 'resourceGroup'

param apimName string
param apiId string
param displayName string
param path string
param serviceUrl string = 'https://example.com'

resource apim 'Microsoft.ApiManagement/service@2022-08-01' existing = {
  name: apimName
}

resource api 'Microsoft.ApiManagement/service/apis@2022-08-01' = {
  parent: apim
  name: apiId
  properties: {
    displayName: displayName
    path: path
    protocols: [
      'https'
    ]
    serviceUrl: serviceUrl
  }
}

output apiId string = api.id
