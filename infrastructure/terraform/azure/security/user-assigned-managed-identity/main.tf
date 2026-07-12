resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.ManagedIdentity/userAssignedIdentities"
  api_version         = "2018-11-30"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
