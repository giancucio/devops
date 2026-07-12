# networking/nsg

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `nsgName` (string) (default: nsg-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `nsgId` (string)

## Example

```hcl
module "networking_nsg" {
  source = "../../../../infrastructure/terraform/azure/networking/nsg"
  # set variables here
}
```
