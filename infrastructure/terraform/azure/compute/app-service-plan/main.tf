resource "azurerm_app_service_plan" "this" {
  name                = var.planName
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = "Standard"
    size = "S1"
  }
}
