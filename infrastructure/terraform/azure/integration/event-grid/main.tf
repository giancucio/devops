resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.EventGrid/topics"
  api_version         = "2024-06-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
