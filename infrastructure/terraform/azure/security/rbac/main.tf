resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Authorization/roleDefinitions"
  api_version         = "2022-04-01-preview"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
