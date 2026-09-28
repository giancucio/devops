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

locals {
  tags = merge(var.tags, {
    managed-by = "terraform"
  })
}

module "vnet" {
  source = "../../../../infrastructure/terraform/azure/networking/vnet"

  vnet_name           = var.vnet_name
  location            = data.terraform_remote_state.foundation.outputs.location
  address_space       = var.vnet_address_space
  resource_group_name = data.terraform_remote_state.foundation.outputs.resource_group_name
  tags                = local.tags
}

module "aks_subnet" {
  source = "../../../../infrastructure/terraform/azure/networking/subnet"

  subnet_name          = var.aks_subnet_name
  resource_group_name  = data.terraform_remote_state.foundation.outputs.resource_group_name
  virtual_network_name = module.vnet.name
  address_prefixes     = var.aks_subnet_prefixes
}