resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Logic/workflows"
  api_version         = "2019-05-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
