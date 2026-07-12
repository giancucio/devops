# integration/apim-named-value

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `apiManagementName` (string) (default: apim-portfolio)
- `namedValueName` (string) (default: example-value)
- `value` (string) (default: example)

## Outputs

- `namedValueId` (string)

## Example

```hcl
module "integration_apim-named-value" {
  source = "../../../../infrastructure/terraform/azure/integration/apim-named-value"
  # set variables here
}
```
