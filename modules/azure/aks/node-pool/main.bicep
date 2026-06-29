targetScope = 'resourceGroup'

param aksName string
param nodePoolName string = 'userpool'
param vmSize string = 'Standard_B2s'
param nodeCount int = 1

resource aks 'Microsoft.ContainerService/managedClusters@2023-09-01' existing = {
  name: aksName
}

resource nodePool 'Microsoft.ContainerService/managedClusters/agentPools@2023-09-01' = {
  parent: aks
  name: nodePoolName
  properties: {
    count: nodeCount
    vmSize: vmSize
    mode: 'User'
    osType: 'Linux'
  }
}

output nodePoolId string = nodePool.id
