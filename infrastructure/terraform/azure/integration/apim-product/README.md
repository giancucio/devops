# integration/apim-product

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `apiManagementName` (string) (default: apim-portfolio)
- `productName` (string) (default: starter)
- `displayName` (string) (default: Starter)

## Outputs

- `productId` (string)

## Example

```hcl
module "integration_apim-product" {
  source = "../../../../infrastructure/terraform/azure/integration/apim-product"
  # set variables here
}
```
