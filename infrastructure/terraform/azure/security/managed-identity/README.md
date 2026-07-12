# security/managed-identity

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `identityName` (string) (default: identity-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `identityId` (string)

## Example

```hcl
module "security_managed-identity" {
  source = "../../../../infrastructure/terraform/azure/security/managed-identity"
  # set variables here
}
```
