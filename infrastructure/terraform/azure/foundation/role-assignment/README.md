# foundation/role-assignment

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `principalId` (string) (default: 00000000-0000-0000-0000-000000000000)
- `roleDefinitionId` (string) (default: /subscriptions/.../providers/Microsoft.Authorization/roleDefinitions/...)
- `scope` (string) (default: /subscriptions/<subscriptionId>)

## Outputs

- `roleAssignmentId` (string)

## Example

```hcl
module "foundation_role-assignment" {
  source = "../../../../infrastructure/terraform/azure/foundation/role-assignment"
  # set variables here
}
```
