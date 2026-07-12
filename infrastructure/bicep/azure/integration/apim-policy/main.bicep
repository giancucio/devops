param location string = 'eastus'
param apiManagementName string = 'apim-portfolio'
param policyContent string = '<policies></policies>'

resource resourceModule 'Microsoft.ApiManagement/service/policies@2022-08-01' = {
  name: '${apiManagementName}/policy'
  location: location
}

output policyId string = resourceModule.id
