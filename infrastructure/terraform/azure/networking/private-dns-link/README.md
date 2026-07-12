# networking/private-dns-link

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `zoneName` (string) (default: privatelinkzone)
- `linkName` (string) (default: vnet-link)
- `virtualNetworkId` (string) (default: /subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/...)

## Outputs

- `linkId` (string)

## Example

```hcl
module "networking_private-dns-link" {
  source = "../../../../infrastructure/terraform/azure/networking/private-dns-link"
  # set variables here
}
```
