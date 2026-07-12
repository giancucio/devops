# networking/private-endpoint

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `privateEndpointName` (string) (default: pe-portfolio)
- `location` (string) (default: eastus)
- `subnetId` (string) (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/.../subnets/...)
- `privateLinkServiceId` (string) (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.Network/privateLinkServices/...)

## Outputs

- `privateEndpointId` (string)

## Example

```hcl
module "networking_private-endpoint" {
  source = "../../../../infrastructure/terraform/azure/networking/private-endpoint"
  # set variables here
}
```
