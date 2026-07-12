param location string = 'eastus'
param vnetName string = 'vnet-portfolio'
param subnetName string = 'subnet1'
param addressPrefix string = '10.0.1.0/24'

resource resourceModule 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  name: '${vnetName}/${subnetName}'
  location: location
}

output subnetId string = resourceModule.id
