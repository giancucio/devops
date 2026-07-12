# networking/application-gateway

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `gatewayName` (string) (default: appgw-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `gatewayId` (string)

## Example

```hcl
module "networking_application-gateway" {
  source = "../../../../infrastructure/terraform/azure/networking/application-gateway"
  # set variables here
}
```
