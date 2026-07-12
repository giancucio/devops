# networking/route-table

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `routeTableName` (string) (default: rt-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `routeTableId` (string)

## Example

```hcl
module "networking_route-table" {
  source = "../../../../infrastructure/terraform/azure/networking/route-table"
  # set variables here
}
```
