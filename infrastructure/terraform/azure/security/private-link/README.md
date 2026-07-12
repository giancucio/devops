# security/private-link

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `serviceName` (string) (default: pls-portfolio)
- `location` (string) (default: eastus)

## Outputs

- `serviceId` (string)

## Example

```hcl
module "security_private-link" {
  source = "../../../../infrastructure/terraform/azure/security/private-link"
  # set variables here
}
```
