resource "azurerm_key_vault" "this" {
  name                = var.keyVaultName
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = "REPLACE_TENANT_ID"
  sku_name            = var.sku_name
}
