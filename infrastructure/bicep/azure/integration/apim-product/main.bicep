param location string = 'eastus'
param apiManagementName string = 'apim-portfolio'
param productName string = 'starter'
param displayName string = 'Starter'

resource resourceModule 'Microsoft.ApiManagement/service/products@2022-08-01' = {
  name: '${apiManagementName}/${productName}'
  location: location
}

output productId string = resourceModule.id
