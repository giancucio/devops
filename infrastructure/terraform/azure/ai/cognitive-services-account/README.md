# ai/cognitive-services-account

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `accountName` (string) (default: cogsvc-portfolio)
- `location` (string) (default: eastus)
- `skuName` (string) (default: S0)

## Outputs

- `accountId` (string)

## Example

```hcl
module "ai_cognitive-services-account" {
  source = "../../../../infrastructure/terraform/azure/ai/cognitive-services-account"
  # set variables here
}
```
