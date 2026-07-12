param location string = 'eastus'
param apiManagementName string = 'apim-portfolio'
param namedValueName string = 'example-value'
param value string = 'example'

resource resourceModule 'Microsoft.ApiManagement/service/namedValues@2022-08-01' = {
  name: '${apiManagementName}/${namedValueName}'
  location: location
}

output namedValueId string = resourceModule.id
