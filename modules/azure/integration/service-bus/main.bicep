targetScope = 'resourceGroup'

param location string = resourceGroup().location
param namespaceName string
param skuName string = 'Standard'
param tags object = {}

resource namespace 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: namespaceName
  location: location
  tags: tags
  sku: {
    name: skuName
    tier: skuName
  }
}

resource queue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: namespace
  name: 'sample-queue'
}

output namespaceId string = namespace.id
output queueId string = queue.id
