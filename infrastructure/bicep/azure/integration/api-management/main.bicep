param serviceName string = 'apim-portfolio'
param location string = 'eastus'
param publisherEmail string = 'admin@example.com'
param publisherName string = 'Contoso'

resource resourceModule 'Microsoft.ApiManagement/service@2022-08-01' = {
  name: serviceName
  location: location
}

output serviceId string = resourceModule.id
