resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Insights/metricAlerts"
  api_version         = "2018-03-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
