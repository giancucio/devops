# Azure Firewall

Deploys an Azure Firewall instance.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `firewallName` (string) - Firewall name (default: azfw-portfolio)
- `location` (string) - Azure location (default: eastus)

## Outputs

- `firewallId` (string)

## Example

```bicep
module firewall './main.bicep' = {
  name: 'firewall-deploy'
  params: {
    firewallName: 'azfw-portfolio'
    location: 'eastus'
  }
}
```
