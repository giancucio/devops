# networking/subnet

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `vnetName` (string) (default: vnet-portfolio)
- `subnetName` (string) (default: subnet1)
- `addressPrefix` (string) (default: 10.0.1.0/24)

## Outputs

- `subnetId` (string)

## Example

```hcl
module "networking_subnet" {
  source = "../../../../infrastructure/terraform/azure/networking/subnet"
  # set variables here
}
```
