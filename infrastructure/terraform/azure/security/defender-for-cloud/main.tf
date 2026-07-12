resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Security/pricings"
  api_version         = "2023-01-01-preview"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
