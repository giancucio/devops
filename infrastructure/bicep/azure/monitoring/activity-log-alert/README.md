# Activity Log Alert

Deploys an Azure Activity Log alert to monitor subscription events.

## Module

This directory contains a reusable Azure Bicep module.

## Parameters

- `alertName` (string) - Activity log alert name (default: activityLogAlert)
- `scope` (string) - Alert scope (default: /subscriptions/<subscriptionId>)

## Outputs

- `alertId` (string)

## Example

```bicep
module activitylogalert './main.bicep' = {
  name: 'activity-log-alert-deploy'
  params: {
    alertName: 'activityLogAlert'
    scope: '/subscriptions/<subscriptionId>'
  }
}
```
