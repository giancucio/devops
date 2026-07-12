resource "azurerm_eventhub_namespace" "this" {
  name                = var.namespaceName
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
}
