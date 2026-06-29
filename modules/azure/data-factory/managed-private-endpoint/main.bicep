targetScope = 'resourceGroup'

param dataFactoryName string
param managedVirtualNetworkName string = 'default'
param privateEndpointName string
param privateLinkResourceId string
param groupId string

resource adf 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource managedVirtualNetwork 'Microsoft.DataFactory/factories/managedVirtualNetworks@2018-06-01' existing = {
  parent: adf
  name: managedVirtualNetworkName
}

resource managedPrivateEndpoint 'Microsoft.DataFactory/factories/managedVirtualNetworks/managedPrivateEndpoints@2018-06-01' = {
  parent: managedVirtualNetwork
  name: privateEndpointName
  properties: {
    privateLinkResourceId: privateLinkResourceId
    groupId: groupId
  }
}

output managedPrivateEndpointId string = managedPrivateEndpoint.id
