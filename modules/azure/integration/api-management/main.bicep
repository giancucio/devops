targetScope = 'resourceGroup'

param location string = resourceGroup().location
param apimName string
param publisherEmail string
param publisherName string = 'Portfolio Demo'
param skuName string = 'Developer'
param skuCapacity int = 1
param tags object = {}

resource apim 'Microsoft.ApiManagement/service@2022-08-01' = {
  name: apimName
  location: location
  tags: tags
  sku: {
    name: skuName
    capacity: skuCapacity
  }
  properties: {
    publisherEmail: publisherEmail
    publisherName: publisherName
    publicNetworkAccess: 'Enabled'
    virtualNetworkType: 'None'
  }
}

output apimId string = apim.id
output gatewayUrl string = apim.properties.gatewayUrl
