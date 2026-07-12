# security/user-assigned-managed-identity

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `identityName` (string) (default: uami-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `identityId` (string)

## Example

```hcl
module "security_user-assigned-managed-identity" {
  source = "../../../../infrastructure/terraform/azure/security/user-assigned-managed-identity"
  # set variables here
}
```
