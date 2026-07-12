# integration/apim-backend

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `apiManagementName` (string) (default: apim-portfolio)
- `backendName` (string) (default: backend-portfolio)
- `backendUrl` (string) (default: https://example.com)

## Outputs

- `backendId` (string)

## Example

```hcl
module "integration_apim-backend" {
  source = "../../../../infrastructure/terraform/azure/integration/apim-backend"
  # set variables here
}
```
