param searchServiceName string = 'search-portfolio'
param location string = 'eastus'
param skuName string = 'standard'
param replicaCount int = 1
param partitionCount int = 1

resource resourceModule 'Microsoft.Search/searchServices@2023-05-01' = {
  name: searchServiceName
  location: location
  properties: {
    sku: {
      name: 'standard'
      tier: 'standard'
    }
  }
}

output searchServiceId string = resourceModule.id
