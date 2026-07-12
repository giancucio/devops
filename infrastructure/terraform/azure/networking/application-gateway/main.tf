resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Network/applicationGateways"
  api_version         = "2023-02-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
