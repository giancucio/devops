resource "azurerm_mssql_server" "this" {
  name                         = var.sqlServerName
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password
}
