resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Network/azureFirewalls"
  api_version         = "2023-05-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
