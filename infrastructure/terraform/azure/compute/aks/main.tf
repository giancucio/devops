resource "azurerm_kubernetes_cluster" "this" {
  name                = var.clusterName
  location            = var.location
  resource_group_name = var.resource_group_name
  default_node_pool {
    name       = "default"
    node_count = var.nodeCount
    vm_size    = var.nodeVmSize
  }
  dns_prefix = var.dnsPrefix
  identity { type = "SystemAssigned" }
}
