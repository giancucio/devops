resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.ApiManagement/service/policies"
  api_version         = "2022-08-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
