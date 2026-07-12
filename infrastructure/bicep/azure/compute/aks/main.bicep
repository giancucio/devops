param clusterName string = 'aks-portfolio'
param location string = 'eastus'
param dnsPrefix string = 'aks'
param nodeCount int = 3
param nodeVmSize string = 'Standard_DS2_v2'

resource resourceModule 'Microsoft.ContainerService/managedClusters@2024-01-01' = {
  name: clusterName
  location: location
  properties: {
    dnsPrefix: dnsPrefix
    agentPoolProfiles: [
      {
        name: 'agentpool'
        count: nodeCount
        vmSize: nodeVmSize
      }
    ]
  }
}

output clusterId string = resourceModule.id
