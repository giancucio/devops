# foundation/resource-group

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `resource_group_name` (string) (default: rg-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `resourceGroupId` (string)

## Example

```hcl
module "foundation_resource-group" {
  source = "../../../../infrastructure/terraform/azure/foundation/resource-group"
  # set variables here
}
```
