param location string = 'eastus'
param zoneName string = 'privatelinkzone'
param linkName string = 'vnet-link'
param virtualNetworkId string = '/subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/...'

resource resourceModule 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  name: '${zoneName}/${linkName}'
  location: location
}

output linkId string = resourceModule.id
