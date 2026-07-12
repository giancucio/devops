# networking/nat-gateway

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `natGatewayName` (string) (default: natgw-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `natGatewayId` (string)

## Example

```hcl
module "networking_nat-gateway" {
  source = "../../../../infrastructure/terraform/azure/networking/nat-gateway"
  # set variables here
}
```
