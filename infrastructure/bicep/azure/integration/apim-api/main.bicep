param location string = 'eastus'
param apiManagementName string = 'apim-portfolio'
param apiName string = 'example-api'
param displayName string = 'Example API'

resource resourceModule 'Microsoft.ApiManagement/service/apis@2022-08-01' = {
  name: '${apiManagementName}/${apiName}'
  location: location
}

output apiId string = resourceModule.id
