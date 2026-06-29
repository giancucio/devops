targetScope = 'resourceGroup'

param location string = resourceGroup().location
param namespaceName string
param eventHubName string = 'sample-events'
param tags object = {}

resource namespace 'Microsoft.EventHub/namespaces@2022-10-01-preview' = {
  name: namespaceName
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 1
  }
}

resource eventHub 'Microsoft.EventHub/namespaces/eventhubs@2022-10-01-preview' = {
  parent: namespace
  name: eventHubName
  properties: {
    partitionCount: 2
    messageRetentionInDays: 1
  }
}

output namespaceId string = namespace.id
output eventHubId string = eventHub.id
