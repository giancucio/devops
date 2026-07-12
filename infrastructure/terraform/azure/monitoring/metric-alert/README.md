# monitoring/metric-alert

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `alertName` (string) (default: metricAlert)
- `targetResourceId` (string) (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.Compute/virtualMachines/...)
- `criteriaValue` (int) (default: 80)

## Outputs

- `alertId` (string)

## Example

```hcl
module "monitoring_metric-alert" {
  source = "../../../../infrastructure/terraform/azure/monitoring/metric-alert"
  # set variables here
}
```
