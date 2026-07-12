# monitoring/application-insights

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `componentName` (string) (default: appinsights-portfolio)
- `location` (string) (default: eastus)
- `applicationType` (string) (default: web)

## Outputs

- `componentId` (string)

## Example

```hcl
module "monitoring_application-insights" {
  source = "../../../../infrastructure/terraform/azure/monitoring/application-insights"
  # set variables here
}
```
