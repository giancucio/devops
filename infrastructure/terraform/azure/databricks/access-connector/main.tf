resource "azurerm_resource" "this" {
  name                = var.workspaceName
  type                = "Microsoft.Databricks/workspaces/accessConnectors"
  api_version         = "2023-04-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
