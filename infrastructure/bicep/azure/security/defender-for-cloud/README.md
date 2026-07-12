# Defender for Cloud Pricing

Deploys Defender for Cloud pricing configuration.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `pricingTier` (string) - Defender pricing tier (default: Standard)

## Outputs

- `pricingId` (string)

## Example

```bicep
module defenderforcloud './main.bicep' = {
  name: 'defender-for-cloud-deploy'
  params: {
    pricingTier: 'Standard'
  }
}
```
