# compute/virtual-machine

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `vmName` (string) (default: vm-portfolio)
- `location` (string) (default: eastus)
- `vmSize` (string) (default: Standard_DS1_v2)
- `adminUsername` (string) (default: azureuser)

## Outputs

- `vmId` (string)

## Example

```hcl
module "compute_virtual-machine" {
  source = "../../../../infrastructure/terraform/azure/compute/virtual-machine"
  # set variables here
}
```
