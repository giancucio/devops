# integration/service-bus

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `namespaceName` (string) (default: sb-portfolio)
- `location` (string) (default: eastus)
- `skuName` (string) (default: Standard)

## Outputs

- `namespaceId` (string)

## Example

```hcl
module "integration_service-bus" {
  source = "../../../../infrastructure/terraform/azure/integration/service-bus"
  # set variables here
}
```
