subscription_id              = "d5736eb1-f851-4ec3-a2c5-ac8d84d029e2"
environment                  = "dev"
tfstate_resource_group_name  = "giancucio-tfstate-rg"
tfstate_storage_account_name = "giancuciotfstatesa"
tfstate_container_name       = "tfstate"
acr_name                     = "giancucioaksdeveus"
aks_name                     = "aks-dev-eastus-giancucio"
dns_prefix                   = "aks-dev-eastus-giancucio"
system_node_count            = 3
system_node_vm_size          = "Standard_DS2_v2"

network_profile = {
  network_plugin      = "azure"
  network_plugin_mode = "overlay"
  load_balancer_sku   = "standard"
  network_policy      = "azure"
  pod_cidr            = "172.20.0.0/16"
  service_cidr        = "10.250.0.0/24"
  dns_service_ip      = "10.250.0.10"
}

