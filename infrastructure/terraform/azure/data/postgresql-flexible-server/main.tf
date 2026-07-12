resource "azurerm_postgresql_flexible_server" "this" {
  name                   = var.serverName
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  sku_name               = var.sku_name
}
