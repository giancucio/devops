# networking/vnet

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `vnetName` (string) (default: vnet-portfolio)
- `location` (string) (default: eastus)
- `addressPrefix` (string) (default: 10.0.0.0/16)

## Outputs

- `vnetId` (string)

## Example

```hcl
module "networking_vnet" {
  source = "../../../../infrastructure/terraform/azure/networking/vnet"
  # set variables here
}
```
