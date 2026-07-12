# integration/apim-api

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `apiManagementName` (string) (default: apim-portfolio)
- `apiName` (string) (default: example-api)
- `displayName` (string) (default: Example API)

## Outputs

- `apiId` (string)

## Example

```hcl
module "integration_apim-api" {
  source = "../../../../infrastructure/terraform/azure/integration/apim-api"
  # set variables here
}
```
