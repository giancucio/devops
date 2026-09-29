subscription_id              = "d5736eb1-f851-4ec3-a2c5-ac8d84d029e2"
environment                  = "dev"
tfstate_resource_group_name  = "giancucio-tfstate-rg"
tfstate_storage_account_name = "giancuciotfstatesa"
tfstate_container_name       = "tfstate"
vnet_name                    = "vnet-aks-dev-eastus"
vnet_address_space           = ["10.60.0.0/16"]
aks_subnet_name              = "snet-aks-dev-eastus"
aks_subnet_prefixes          = ["10.60.1.0/24"]

