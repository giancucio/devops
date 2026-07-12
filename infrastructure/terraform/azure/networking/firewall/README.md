# networking/firewall

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `firewallName` (string) (default: azfw-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `firewallId` (string)

## Example

```hcl
module "networking_firewall" {
  source = "../../../../infrastructure/terraform/azure/networking/firewall"
  # set variables here
}
```
