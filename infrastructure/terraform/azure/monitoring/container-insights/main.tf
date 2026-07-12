resource "azurerm_resource" "this" {
  name                = var.workspaceName
  type                = "Microsoft.OperationalInsights/workspaces"
  api_version         = "2021-06-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
