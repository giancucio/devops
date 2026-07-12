resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Insights/actionGroups"
  api_version         = "2022-06-15"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
