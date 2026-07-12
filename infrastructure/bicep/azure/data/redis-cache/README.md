# Redis Cache

Deploys an Azure Redis Cache instance.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `redisName` (string) - Redis cache name (default: redis-portfolio)
- `location` (string) - Azure location (default: eastus)
- `skuName` (string) - Redis SKU name (default: Standard)

## Outputs

- `redisId` (string)

## Example

```bicep
module rediscache './main.bicep' = {
  name: 'redis-cache-deploy'
  params: {
    redisName: 'redis-portfolio'
    location: 'eastus'
    skuName: 'Standard'
  }
}
```
