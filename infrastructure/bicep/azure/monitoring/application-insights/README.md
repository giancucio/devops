# Application Insights

Deploys an Application Insights resource for telemetry.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `componentName` (string) - Application Insights name (default: appinsights-portfolio)
- `location` (string) - Azure location (default: eastus)
- `applicationType` (string) - Application type (default: web)

## Outputs

- `componentId` (string)

## Example

```bicep
module applicationinsights './main.bicep' = {
  name: 'application-insights-deploy'
  params: {
    componentName: 'appinsights-portfolio'
    location: 'eastus'
    applicationType: 'web'
  }
}
```
