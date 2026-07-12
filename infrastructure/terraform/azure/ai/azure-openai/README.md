# ai/azure-openai

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `accountName` (string) (default: openai-portfolio)
- `location` (string) (default: eastus)
- `skuName` (string) (default: S0)

## Outputs

- `accountId` (string)

## Example

```hcl
module "ai_azure-openai" {
  source = "../../../../infrastructure/terraform/azure/ai/azure-openai"
  # set variables here
}
```
