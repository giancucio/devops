resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Insights/activityLogAlerts"
  api_version         = "2017-04-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
