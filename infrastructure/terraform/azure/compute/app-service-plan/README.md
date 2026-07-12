# compute/app-service-plan

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `planName` (string) (default: asp-portfolio)
- `location` (string) (default: eastus)
- `skuName` (string) (default: P1v2)

## Outputs

- `planId` (string)

## Example

```hcl
module "compute_app-service-plan" {
  source = "../../../../infrastructure/terraform/azure/compute/app-service-plan"
  # set variables here
}
```
