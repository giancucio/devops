param serviceName string = 'pls-portfolio'
param location string = 'eastus'

resource resourceModule 'Microsoft.Network/privateLinkServices@2023-05-01' = {
  name: serviceName
  location: location
}

output serviceId string = resourceModule.id
