# networking/front-door

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `profileName` (string) (default: frontdoor-portfolio)
- `location` (string) (default: global)

## Outputs

- `profileId` (string)

## Example

```hcl
module "networking_front-door" {
  source = "../../../../infrastructure/terraform/azure/networking/front-door"
  # set variables here
}
```
