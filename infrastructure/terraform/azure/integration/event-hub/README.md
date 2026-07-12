# integration/event-hub

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `namespaceName` (string) (default: eventhub-namespace)
- `location` (string) (default: eastus)

## Outputs

- `namespaceId` (string)

## Example

```hcl
module "integration_event-hub" {
  source = "../../../../infrastructure/terraform/azure/integration/event-hub"
  # set variables here
}
```
