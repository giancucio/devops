# compute/app-service

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `appName` (string) (default: app-portfolio)
- `location` (string) (default: eastus)
- `servicePlanId` (string) (default: service-plan-id)

## Outputs

- `appId` (string)

## Example

```hcl
module "compute_app-service" {
  source = "../../../../infrastructure/terraform/azure/compute/app-service"
  # set variables here
}
```
