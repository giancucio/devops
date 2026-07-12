resource "azurerm_network_security_group" "this" {
  name                = var.nsgName
  resource_group_name = var.resource_group_name
  location            = var.location
}
