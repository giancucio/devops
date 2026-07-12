# integration/apim-policy

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `apiManagementName` (string) (default: apim-portfolio)
- `policyContent` (string) (default: <policies></policies>)

## Outputs

- `policyId` (string)

## Example

```hcl
module "integration_apim-policy" {
  source = "../../../../infrastructure/terraform/azure/integration/apim-policy"
  # set variables here
}
```
