# data-factory/integration-runtime

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `factoryName` (string) (default: adf-portfolio)
- `integrationRuntimeName` (string) (default: selfhosted)
- `location` (string) (default: eastus)

## Outputs

- `runtimeId` (string)

## Example

```hcl
module "data-factory_integration-runtime" {
  source = "../../../../infrastructure/terraform/azure/data-factory/integration-runtime"
  # set variables here
}
```
