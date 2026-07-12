# Azure Cognitive Search

Deploys an Azure Cognitive Search service for indexing and search workloads.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `searchServiceName` (string) - Search service name (default: search-portfolio)
- `location` (string) - Azure location (default: eastus)
- `skuName` (string) - Search service SKU (default: standard)
- `replicaCount` (int) - Number of replicas (default: 1)
- `partitionCount` (int) - Number of partitions (default: 1)

## Outputs

- `searchServiceId` (string)

## Example

```bicep
module aisearch './main.bicep' = {
  name: 'ai-search-deploy'
  params: {
    searchServiceName: 'search-portfolio'
    location: 'eastus'
    skuName: 'standard'
    replicaCount: 1
    partitionCount: 1
  }
}
```
