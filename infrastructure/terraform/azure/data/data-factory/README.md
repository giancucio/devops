# data/data-factory

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `factoryName` (string) (default: adf-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `factoryId` (string)

## Example

```hcl
module "data_data-factory" {
  source = "../../../../infrastructure/terraform/azure/data/data-factory"
  # set variables here
}
```
