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

data "azurerm_client_config" "current" {}

locals {
  tags = merge(var.tags, {
    managed-by = "terraform"
  })
}

module "key_vault" {
  source = "../../../../infrastructure/terraform/azure/security/key-vault"

  key_vault_name                = var.key_vault_name
  location                      = data.terraform_remote_state.foundation.outputs.location
  resource_group_name           = data.terraform_remote_state.foundation.outputs.resource_group_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  public_network_access_enabled = false
  tags                          = local.tags
}