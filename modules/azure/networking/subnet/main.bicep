targetScope = 'resourceGroup'

param vnetName string
param subnetName string
param addressPrefix string = '10.0.1.0/24'

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' existing = {
  name: vnetName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-09-01' = {
  parent: vnet
  name: subnetName
  properties: {
    addressPrefix: addressPrefix
  }
}

output subnetId string = subnet.id
