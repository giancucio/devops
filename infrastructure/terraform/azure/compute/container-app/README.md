# compute/container-app

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `containerAppName` (string) (default: ca-portfolio)
- `location` (string) (default: eastus)
- `environmentId` (string) (default: container-app-env-id)

## Outputs

- `containerAppId` (string)

## Example

```hcl
module "compute_container-app" {
  source = "../../../../infrastructure/terraform/azure/compute/container-app"
  # set variables here
}
```
