locals {
  tags = {
    project     = "azure-terraform-aks"
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}

module "networking_vnet" {
  source = "../../../infrastructure/terraform/azure/networking/vnet"

  vnetName            = var.vnet_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  addressPrefix       = var.vnet_cidr
}

module "compute_aks" {
  source = "../../../infrastructure/terraform/azure/compute/aks"

  clusterName         = var.aks_cluster_name
  location            = azurerm_resource_group.aks.location
  dnsPrefix           = var.dns_prefix
  nodeCount           = var.node_count
  nodeVmSize          = var.node_vm_size
  resource_group_name = azurerm_resource_group.aks.name

  depends_on = [module.networking_vnet]
}

data "azurerm_virtual_network" "aks" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.aks.name

  depends_on = [module.networking_vnet]
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  resource_group_name = azurerm_resource_group.aks.name

  depends_on = [module.compute_aks]
}
