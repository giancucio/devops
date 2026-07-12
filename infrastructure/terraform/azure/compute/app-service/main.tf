resource "azurerm_app_service" "this" {
  name                = var.appName
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = "REPLACE_APP_SERVICE_PLAN_ID"
}
