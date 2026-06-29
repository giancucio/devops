targetScope = 'resourceGroup'

param apimName string
param namedValueId string
param displayName string
param value string
param secret bool = false

resource apim 'Microsoft.ApiManagement/service@2022-08-01' existing = {
  name: apimName
}

resource namedValue 'Microsoft.ApiManagement/service/namedValues@2022-08-01' = {
  parent: apim
  name: namedValueId
  properties: {
    displayName: displayName
    value: value
    secret: secret
  }
}

output namedValueResourceId string = namedValue.id
