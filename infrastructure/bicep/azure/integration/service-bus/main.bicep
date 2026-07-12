param namespaceName string = 'sb-portfolio'
param location string = 'eastus'
param skuName string = 'Standard'

resource resourceModule 'Microsoft.ServiceBus/namespaces@2023-05-01' = {
  name: namespaceName
  location: location
}

output namespaceId string = resourceModule.id
