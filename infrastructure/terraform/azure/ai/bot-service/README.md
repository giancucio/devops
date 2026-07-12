# ai/bot-service

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `botName` (string) (default: bot-portfolio)
- `location` (string) (default: eastus)
- `appId` (string) (default: )

## Outputs

- `botId` (string)

## Example

```hcl
module "ai_bot-service" {
  source = "../../../../infrastructure/terraform/azure/ai/bot-service"
  # set variables here
}
```
