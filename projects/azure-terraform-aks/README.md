# Azure AKS Infrastructure (Terraform)

This project provisions an Azure Kubernetes Service (AKS) environment using shared Terraform modules from this repository's Azure module catalog.

## What this project creates

- An Azure Resource Group
- A Virtual Network using the shared module at `infrastructure/terraform/azure/networking/vnet`
- An AKS cluster using the shared module at `infrastructure/terraform/azure/compute/aks`

## Structure

- `terraform/` contains the Terraform root module for this project.

## Prerequisites

- Terraform 1.6 or newer
- Azure CLI logged in (`az login`)
- Sufficient Azure RBAC permissions to create resource groups, virtual networks, and AKS clusters

## Deploy

1. Copy `terraform/terraform.tfvars.example` to `terraform/terraform.tfvars`
2. Update values for your environment
3. Run Terraform:

```powershell
Set-Location terraform
terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

## Destroy

```powershell
Set-Location terraform
terraform destroy
```

## Notes

- This root module intentionally consumes shared modules from `infrastructure/terraform/azure`.
- Some shared modules in this repository still contain placeholder outputs; this project uses data sources for runtime outputs where needed.

## Azure DevOps Pipeline

This project includes [azure-pipelines.yml](azure-pipelines.yml) with two stages:

- `ValidateAndPlan`: runs `terraform init`, `fmt`, `validate`, and `plan`, then publishes a plan text artifact
- `Apply`: runs only on `main` when `applyChanges` is `true`

### Required Pipeline Variables

- `azureServiceConnection`: Name of your Azure Resource Manager service connection
- `applyChanges`: Set to `true` to enable apply stage on main (default `false`)
- `environmentName`: Azure DevOps environment name used by the deployment job

### Optional Remote State Variables

Set these when you want to use Azure Storage backend in the pipeline:

- `tfStateResourceGroup`
- `tfStateStorageAccount`
- `tfStateContainer`
- `tfStateKey`

If these are left empty, pipeline runs with the default local backend behavior in this Terraform root module.
