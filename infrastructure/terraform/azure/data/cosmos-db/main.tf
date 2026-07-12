resource "azurerm_cosmosdb_account" "this" {
  name                = var.accountName
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer_type
  consistency_policy {
    consistency_level = var.consistency_level
  }
}
