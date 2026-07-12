# compute/aks

This Terraform module was generated as a skeleton from the corresponding Bicep module.

## Variables

- `clusterName` (string) (default: aks-portfolio)
- `location` (string) (default: eastus)
- `dnsPrefix` (string) (default: aks)

## Outputs

- `clusterId` (string)

## Example

```hcl
module "compute_aks" {
  source = "../../../../infrastructure/terraform/azure/compute/aks"
  # set variables here
}
```
