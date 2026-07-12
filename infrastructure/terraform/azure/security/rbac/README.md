# security/rbac

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `roleName` (string) (default: CustomRole)
- `description` (string) (default: Custom role definition)
- `permissions` (array) (default: [{'actions': ['*'], 'notActions': []}])
- `assignableScopes` (array) (default: ['/subscriptions/<subscriptionId>'])

## Outputs

- `roleDefinitionId` (string)

## Example

```hcl
module "security_rbac" {
  source = "../../../../infrastructure/terraform/azure/security/rbac"
  # set variables here
}
```
