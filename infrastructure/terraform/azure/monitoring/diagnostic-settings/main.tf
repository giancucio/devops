resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Insights/diagnosticSettings"
  api_version         = "2021-05-01-preview"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
