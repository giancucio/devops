targetScope = 'resourceGroup'

param location string = resourceGroup().location
param vnetName string
param addressPrefixes array = [
  '10.0.0.0/16'
]
param tags object = {}

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: vnetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: addressPrefixes
    }
  }
}

output vnetId string = vnet.id
output vnetName string = vnet.name
