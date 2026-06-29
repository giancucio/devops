targetScope = 'resourceGroup'

param location string = resourceGroup().location
param aksName string
param dnsPrefix string = aksName
param tags object = {}

resource aks 'Microsoft.ContainerService/managedClusters@2023-09-01' = {
  name: aksName
  location: location
  tags: tags
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: dnsPrefix
    agentPoolProfiles: [
      {
        name: 'system'
        count: 1
        vmSize: 'Standard_B2s'
        mode: 'System'
      }
    ]
  }
}

output aksId string = aks.id
output kubeletIdentity object = aks.properties.identityProfile
