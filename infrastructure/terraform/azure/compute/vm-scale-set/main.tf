resource "azurerm_resource" "this" {
  name                = var.name
  type                = "Microsoft.Compute/virtualMachineScaleSets"
  api_version         = "2024-04-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  properties          = {}
}
