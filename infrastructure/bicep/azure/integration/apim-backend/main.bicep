param location string = 'eastus'
param apiManagementName string = 'apim-portfolio'
param backendName string = 'backend-portfolio'
param backendUrl string = 'https://example.com'

resource resourceModule 'Microsoft.ApiManagement/service/backends@2022-08-01' = {
  name: '${apiManagementName}/${backendName}'
  location: location
}

output backendId string = resourceModule.id
