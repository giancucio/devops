# AKS Node Pool

Deploys a node pool into an existing AKS cluster.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `clusterName` (string) - Existing AKS cluster name (default: aks-portfolio)
- `nodePoolName` (string) - AKS node pool name (default: default)
- `location` (string) - Azure location (default: eastus)
- `count` (int) - Number of nodes in the pool (default: 3)

## Outputs

- `nodePoolId` (string)

## Example

```bicep
module nodepool './main.bicep' = {
  name: 'node-pool-deploy'
  params: {
    clusterName: 'aks-portfolio'
    nodePoolName: 'default'
    location: 'eastus'
    count: 3
  }
}
```
