# monitoring/activity-log-alert

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `alertName` (string) (default: activityLogAlert)
- `scope` (string) (default: /subscriptions/<subscriptionId>)

## Outputs

- `alertId` (string)

## Example

```hcl
module "monitoring_activity-log-alert" {
  source = "../../../../infrastructure/terraform/azure/monitoring/activity-log-alert"
  # set variables here
}
```
