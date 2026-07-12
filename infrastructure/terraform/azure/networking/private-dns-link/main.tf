resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Network/privateDnsZones/virtualNetworkLinks"
  api_version         = "2020-06-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
