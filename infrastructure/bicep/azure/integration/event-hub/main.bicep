param namespaceName string = 'eventhub-namespace'
param location string = 'eastus'

resource resourceModule 'Microsoft.EventHub/namespaces@2023-04-01' = {
  name: namespaceName
  location: location
}

output namespaceId string = resourceModule.id
