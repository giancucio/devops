subscription_id              = "d5736eb1-f851-4ec3-a2c5-ac8d84d029e2"
environment                  = "dev"
tfstate_resource_group_name  = "giancucio-tfstate-rg"
tfstate_storage_account_name = "giancuciotfstatesa"
tfstate_container_name       = "tfstate"
key_vault_name               = "giancucioaksdevkv"

tags = {
  environment = "dev"
  project     = "azure-terraform-aks"
  owner       = "gian"
}