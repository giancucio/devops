param clusterName string = 'aks-portfolio'
param nodePoolName string = 'default'
param location string = 'eastus'
param count int = 3

resource resourceModule 'Microsoft.ContainerService/managedClusters/agentPools@2024-02-01' = {
  name: '${clusterName}/${nodePoolName}'
  location: location
}

output nodePoolId string = resourceModule.id
