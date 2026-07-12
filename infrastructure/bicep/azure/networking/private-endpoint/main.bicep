param privateEndpointName string = 'pe-portfolio'
param location string = 'eastus'
param subnetId string = '/subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/.../subnets/...'
param privateLinkServiceId string = '/subscriptions/.../resourceGroups/.../providers/Microsoft.Network/privateLinkServices/...'

resource resourceModule 'Microsoft.Network/privateEndpoints@2023-05-01' = {
  name: privateEndpointName
  location: location
}

output privateEndpointId string = resourceModule.id
