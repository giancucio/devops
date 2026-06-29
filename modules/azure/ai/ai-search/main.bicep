targetScope = 'resourceGroup'

param location string = resourceGroup().location
param searchServiceName string
param skuName string = 'basic'
param tags object = {}

resource search 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  tags: tags
  sku: {
    name: skuName
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

output searchServiceId string = search.id
