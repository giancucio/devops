# foundation/policy-assignment

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `assignmentName` (string) (default: policyAssignment)
- `policyDefinitionId` (string) (default: /subscriptions/.../providers/Microsoft.Authorization/policyDefinitions/...)
- `scope` (string) (default: /subscriptions/<subscriptionId>)

## Outputs

- `assignmentId` (string)

## Example

```hcl
module "foundation_policy-assignment" {
  source = "../../../../infrastructure/terraform/azure/foundation/policy-assignment"
  # set variables here
}
```
