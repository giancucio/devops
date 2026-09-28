output "resource_group_name" {
  value = data.terraform_remote_state.foundation.outputs.resource_group_name
}

output "aks_name" {
  value = module.aks.name
}

output "aks_id" {
  value = module.aks.id
}

output "kube_config_command" {
  value = "az aks get-credentials --resource-group ${data.terraform_remote_state.foundation.outputs.resource_group_name} --name ${module.aks.name} --overwrite-existing"
}

output "node_resource_group" {
  value = module.aks.node_resource_group
}

output "acr_name" {
  value = azurerm_container_registry.this.name
}

output "acr_login_server" {
  value = azurerm_container_registry.this.login_server
}

output "acr_id" {
  value = azurerm_container_registry.this.id
}