# security/key-vault

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `keyVaultName` (string) (default: kv-portfolio)
- `location` (string) (default: eastus)
- `tenantId` (string) (default: 00000000-0000-0000-0000-000000000000)

## Outputs

- `keyVaultId` (string)

## Example

```hcl
module "security_key-vault" {
  source = "../../../../infrastructure/terraform/azure/security/key-vault"
  # set variables here
}
```
