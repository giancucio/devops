# foundation/management-lock

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `lockName` (string) (default: readOnlyLock)
- `lockLevel` (string) (default: CanNotDelete)
- `notes` (string) (default: Protect resource)

## Outputs

- `lockId` (string)

## Example

```hcl
module "foundation_management-lock" {
  source = "../../../../infrastructure/terraform/azure/foundation/management-lock"
  # set variables here
}
```
