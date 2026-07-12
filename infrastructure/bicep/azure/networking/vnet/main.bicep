param vnetName string = 'vnet-portfolio'
param location string = 'eastus'
param addressPrefix string = '10.0.0.0/16'

resource resourceModule 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
  }
}

output vnetId string = resourceModule.id
