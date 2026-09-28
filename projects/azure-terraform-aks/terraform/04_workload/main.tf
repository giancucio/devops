data "terraform_remote_state" "foundation" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.tfstate_resource_group_name
    storage_account_name = var.tfstate_storage_account_name
    container_name       = var.tfstate_container_name
    key                  = "aks-${var.environment}-01_foundation.tfstate"
    subscription_id      = var.subscription_id
    use_azuread_auth     = true
    use_cli              = true
  }
}

data "terraform_remote_state" "network" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.tfstate_resource_group_name
    storage_account_name = var.tfstate_storage_account_name
    container_name       = var.tfstate_container_name
    key                  = "aks-${var.environment}-03_network.tfstate"
    subscription_id      = var.subscription_id
    use_azuread_auth     = true
    use_cli              = true
  }
}

locals {
  tags = merge(var.tags, {
    managed-by = "terraform"
  })
}

resource "azurerm_container_registry" "this" {
  name                = var.acr_name
  resource_group_name = data.terraform_remote_state.foundation.outputs.resource_group_name
  location            = data.terraform_remote_state.foundation.outputs.location
  sku                 = "Basic"
  admin_enabled       = false
  tags                = local.tags
}

module "aks" {
  source = "../../../../infrastructure/terraform/azure/compute/aks"

  cluster_name               = var.aks_name
  location                   = data.terraform_remote_state.foundation.outputs.location
  resource_group_name        = data.terraform_remote_state.foundation.outputs.resource_group_name
  dns_prefix                 = var.dns_prefix
  kubernetes_version         = var.kubernetes_version
  system_node_count          = var.system_node_count
  system_node_vm_size        = var.system_node_vm_size
  subnet_id                  = data.terraform_remote_state.network.outputs.aks_subnet_id
  network_plugin             = var.network_profile.network_plugin
  network_plugin_mode        = var.network_profile.network_plugin_mode
  load_balancer_sku          = var.network_profile.load_balancer_sku
  network_policy             = var.network_profile.network_policy
  pod_cidr                   = var.network_profile.pod_cidr
  service_cidr               = var.network_profile.service_cidr
  dns_service_ip             = var.network_profile.dns_service_ip
  log_analytics_workspace_id = data.terraform_remote_state.foundation.outputs.log_analytics_workspace_id
  tags                       = local.tags
}

module "acr_pull_role_assignment" {
  source = "../../../../infrastructure/terraform/azure/foundation/role-assignment"

  scope                = azurerm_container_registry.this.id
  role_definition_name = "AcrPull"
  principal_id         = module.aks.kubelet_identity_object_id
  principal_type       = "ServicePrincipal"
}