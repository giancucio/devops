# Metric Alert

Deploys a metric alert for Azure monitoring.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `alertName` (string) - Metric alert name (default: metricAlert)
- `targetResourceId` (string) - Target resource ID (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.Compute/virtualMachines/...)
- `criteriaValue` (int) - Metric threshold (default: 80)

## Outputs

- `alertId` (string)

## Example

```bicep
module metricalert './main.bicep' = {
  name: 'metric-alert-deploy'
  params: {
    alertName: 'metricAlert'
    targetResourceId: '/subscriptions/.../resourceGroups/.../providers/Microsoft.Compute/virtualMachines/...'
    criteriaValue: 80
  }
}
```
