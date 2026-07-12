# Front Door

Deploys an Azure Front Door profile for global traffic routing.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `profileName` (string) - Front Door profile name (default: frontdoor-portfolio)
- `location` (string) - Resource location (default: global)

## Outputs

- `profileId` (string)

## Example

```bicep
module frontdoor './main.bicep' = {
  name: 'front-door-deploy'
  params: {
    profileName: 'frontdoor-portfolio'
    location: 'global'
  }
}
```
