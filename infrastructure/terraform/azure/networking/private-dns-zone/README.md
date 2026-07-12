# networking/private-dns-zone

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `zoneName` (string) (default: privatelinkzone)
- `location` (string) (default: global)

## Outputs

- `zoneId` (string)

## Example

```hcl
module "networking_private-dns-zone" {
  source = "../../../../infrastructure/terraform/azure/networking/private-dns-zone"
  # set variables here
}
```
