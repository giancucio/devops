resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.App/containerApps"
  api_version         = "2024-01-01-preview"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
