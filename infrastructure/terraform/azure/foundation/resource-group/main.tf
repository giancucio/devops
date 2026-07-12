resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Resources/resourceGroups"
  api_version         = "2021-04-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
