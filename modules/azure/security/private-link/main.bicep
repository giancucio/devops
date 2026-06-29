targetScope = 'resourceGroup'

param location string = resourceGroup().location
param privateEndpointName string
param subnetId string
param targetResourceId string
param groupIds array
param tags object = {}

resource privateEndpoint 'Microsoft.Network/privateEndpoints@2023-09-01' = {
  name: privateEndpointName
  location: location
  tags: tags
  properties: {
    subnet: {
      id: subnetId
    }
    privateLinkServiceConnections: [
      {
        name: '${privateEndpointName}-connection'
        properties: {
          privateLinkServiceId: targetResourceId
          groupIds: groupIds
        }
      }
    ]
  }
}

output privateEndpointId string = privateEndpoint.id
