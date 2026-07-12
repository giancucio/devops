# compute/function-app

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `functionName` (string) (default: func-portfolio)
- `location` (string) (default: eastus)
- `servicePlanId` (string) (default: service-plan-id)

## Outputs

- `functionId` (string)

## Example

```hcl
module "compute_function-app" {
  source = "../../../../infrastructure/terraform/azure/compute/function-app"
  # set variables here
}
```
