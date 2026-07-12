resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Authorization/locks"
  api_version         = "2022-04-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
