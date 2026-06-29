targetScope = 'resourceGroup'

param apimName string
param productId string
param displayName string
param description string = 'Portfolio product'

resource apim 'Microsoft.ApiManagement/service@2022-08-01' existing = {
  name: apimName
}

resource product 'Microsoft.ApiManagement/service/products@2022-08-01' = {
  parent: apim
  name: productId
  properties: {
    displayName: displayName
    description: description
    subscriptionRequired: true
    approvalRequired: false
    state: 'published'
  }
}

output productResourceId string = product.id
