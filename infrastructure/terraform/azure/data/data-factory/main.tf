resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.DataFactory/factories"
  api_version         = "2023-03-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
