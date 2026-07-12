# integration/event-grid

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `topicName` (string) (default: eventgrid-topic)
- `location` (string) (default: eastus)

## Outputs

- `topicId` (string)

## Example

```hcl
module "integration_event-grid" {
  source = "../../../../infrastructure/terraform/azure/integration/event-grid"
  # set variables here
}
```
