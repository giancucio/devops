# Azure AKS Infrastructure (Terraform)

This portfolio project provisions Azure infrastructure for AKS with reusable modules from `infrastructure/terraform/azure`. The Terraform directory contains four independent roots, each with a separate Azure Storage state key.

## Stack Layout

| Directory | Responsibility | State key |
|---|---|---|
| `terraform/01_foundation` | Resource group, Log Analytics, Application Insights, Azure Monitor workspace, and Grafana | `aks-dev-01_foundation.tfstate` |
| `terraform/02_security` | Key Vault | `aks-dev-02_security.tfstate` |
| `terraform/03_network` | Virtual network and AKS subnet | `aks-dev-03_network.tfstate` |
| `terraform/04_workload` | Container Registry, AKS, and ACR pull role assignment | `aks-dev-04_workload.tfstate` |

Each stack has its own `backend.tf`, `provider.tf`, `main.tf`, `variables.tf`, `outputs.tf`, and `environments/dev.tfvars`. Deploy in numeric order. Security and network both consume foundation outputs; workload consumes foundation and network outputs through `terraform_remote_state`.

The shared `terraform/terraform.tfvars` file supplies values used by all four stacks, including the `deployed_by = "Gian Cucio"` resource tag. The pipeline loads this file together with each stack's environment-specific tfvars file.

The Key Vault uses RBAC authorization, purge protection, and disabled public network access. Configure private connectivity before workloads need to retrieve secrets from it. ACR, Azure Monitor workspace, and managed Grafana are declared directly because the shared catalog does not have modules for them.

## Existing State Warning

The previous single-root configuration used the state key `aks.tfstate`. The new stack keys are separate and are not automatically populated from it. **Do not enable pipeline Apply or apply any new stack until the existing state has been backed up, inspected, and split into the four stack states.** Terraform `moved` blocks cannot migrate resources between separate state files. The pipeline's `stateMigrationComplete` run parameter defaults to `false` and should only be set to `true` after that migration and review are complete. Keep the old state as a recoverable backup.

## Azure DevOps

The pipeline in [azure-pipelines.yml](azure-pipelines.yml) has four stages: Foundation, Security, Network, and Workload. Each stage has a manual gate before Plan and a second manual gate before Apply. Set `stageToRun=all` for a long-lived ordered run, then resume each stage's Plan and Apply gates as needed. Set `stageToRun` to one parent stage for a standalone run; Security, Network, and Workload require prerequisite remote-state outputs to already exist. Plans are available before state migration, while Apply remains blocked until `stateMigrationComplete=true` after the existing state has been split and verified. Namespace bootstrap runs after the Workload apply.

The Azure service connection and state storage settings are configured as pipeline variables. The state storage account and container must already exist, and the service connection needs access to both the state blobs and deployed resources.

## GitHub Actions

The repository also includes [aks-terraform.yml](../../.github/workflows/aks-terraform.yml). Run it manually from the Actions tab and select a stage plus `plan` or `apply`. The Apply job uses a protected GitHub Environment named `aks-<stage>-apply`, so configure required reviewers for `aks-01_foundation-apply`, `aks-02_security-apply`, `aks-03_network-apply`, and `aks-04_workload-apply` in repository settings.

Configure these repository secrets for OIDC authentication:

- `AZURE_CLIENT_ID`
- `AZURE_TENANT_ID`
- `AZURE_SUBSCRIPTION_ID`

The Azure service principal must have `Storage Blob Data Contributor` on the Terraform state storage account and the required Azure resource permissions. The `apply` operation requires `state_migration_complete=true`; leave it false until the existing state has been migrated and reviewed.

## Local Checks

Run each command from the selected stack directory. Use that stack's environment file and a unique backend key. For example:

```powershell
Set-Location terraform/01_foundation
terraform init `
	-backend-config="resource_group_name=<state-resource-group>" `
	-backend-config="storage_account_name=<state-storage-account>" `
	-backend-config="container_name=<state-container>" `
	-backend-config="key=aks-dev-01_foundation.tfstate" `
	-backend-config="use_azuread_auth=true" `
	-backend-config="use_cli=true"
terraform fmt -check -recursive
terraform validate
terraform plan \
	-var-file="../terraform.tfvars" \
	-var-file="environments/dev.tfvars"
```

Repeat for each layer in order, changing directories and the backend key to match. A plan is not safe to apply until the existing single state has been migrated and its resource addresses verified.
