targetScope = 'resourceGroup'

param apimName string
param backendId string
param url string
param protocol string = 'http'

resource apim 'Microsoft.ApiManagement/service@2022-08-01' existing = {
  name: apimName
}

resource backend 'Microsoft.ApiManagement/service/backends@2022-08-01' = {
  parent: apim
  name: backendId
  properties: {
    url: url
    protocol: protocol
  }
}

output backendResourceId string = backend.id
