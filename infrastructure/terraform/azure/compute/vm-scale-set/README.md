# compute/vm-scale-set

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `vmssName` (string) (default: vmss-portfolio)
- `location` (string) (default: eastus)
- `instanceCount` (int) (default: 2)

## Outputs

- `vmssId` (string)

## Example

```hcl
module "compute_vm-scale-set" {
  source = "../../../../infrastructure/terraform/azure/compute/vm-scale-set"
  # set variables here
}
```
