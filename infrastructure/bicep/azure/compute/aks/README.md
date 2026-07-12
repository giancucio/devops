# AKS Cluster (Compute)

Deploys an AKS cluster as a compute platform.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `clusterName` (string) - AKS cluster name (default: aks-portfolio)
- `location` (string) - Azure location (default: eastus)
- `dnsPrefix` (string) - AKS DNS prefix (default: aks)
 - `dnsPrefix` (string) - AKS DNS prefix (default: aks)
 - `nodeCount` (int) - Default node count (default: 3)
 - `nodeVmSize` (string) - Node VM size (default: Standard_DS2_v2)

## Outputs

- `clusterId` (string)

## Example

```bicep
module aks './main.bicep' = {
  name: 'aks-deploy'
  params: {
    clusterName: 'aks-portfolio'
    location: 'eastus'
    dnsPrefix: 'aks'
    nodeCount: 3
    nodeVmSize: 'Standard_DS2_v2'
  }
}
```
