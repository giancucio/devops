# integration/api-management

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `serviceName` (string) (default: apim-portfolio)
- `location` (string) (default: eastus)
- `publisherEmail` (string) (default: admin@example.com)
- `publisherName` (string) (default: Contoso)

## Outputs

- `serviceId` (string)

## Example

```hcl
module "integration_api-management" {
  source = "../../../../infrastructure/terraform/azure/integration/api-management"
  # set variables here
}
```
