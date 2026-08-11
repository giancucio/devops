resource_group_name          = "rg-aks-dev-eastus"
location                     = "eastus"
vnet_name                    = "vnet-aks-dev-eastus"
aks_subnet_name              = "snet-aks-dev-eastus"
log_analytics_workspace_name = "law-aks-dev-eastus"
acr_name                     = "giancucioaksdeveus"
aks_name                     = "aks-dev-eastus"
dns_prefix                   = "aks-dev-eastus"
system_node_count            = 3
system_node_vm_size          = "Standard_DS2_v2"

vnet_address_space  = ["10.60.0.0/16"]
aks_subnet_prefixes = ["10.60.1.0/24"]

network_profile = {
  network_plugin      = "azure"
  network_plugin_mode = "overlay"
  load_balancer_sku   = "standard"
  network_policy      = "azure"
  pod_cidr            = "172.20.0.0/16"
  service_cidr        = "10.250.0.0/24"
  dns_service_ip      = "10.250.0.10"
}

application_insights_name = "appi-aks-dev-eastus"
monitor_workspace_name    = "amw-aks-dev-eastus"
grafana_name              = "grafana-aks-dev-eastus"

subscription_id = "d5736eb1-f851-4ec3-a2c5-ac8d84d029e2"

tags = {
  environment = "dev"
  project     = "azure-terraform-aks"
  owner       = "gian"
}
