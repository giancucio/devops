output "resource_group_name" {
  description = "Resource group containing the AKS deployment."
  value       = azurerm_resource_group.aks.name
}

output "vnet_id" {
  description = "ID of the virtual network created by the shared module."
  value       = data.azurerm_virtual_network.aks.id
}

output "aks_cluster_id" {
  description = "ID of the AKS cluster created by the shared module."
  value       = data.azurerm_kubernetes_cluster.aks.id
}

output "aks_fqdn" {
  description = "Public FQDN for the AKS API server."
  value       = data.azurerm_kubernetes_cluster.aks.fqdn
}
