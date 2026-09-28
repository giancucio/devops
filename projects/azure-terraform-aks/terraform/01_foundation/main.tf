locals {
  tags = merge(var.tags, {
    managed-by = "terraform"
  })
}

module "resource_group" {
  source = "../../../../infrastructure/terraform/azure/foundation/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.tags
}

module "log_analytics_workspace" {
  source = "../../../../infrastructure/terraform/azure/monitoring/log-analytics-workspace"

  workspace_name      = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.tags
}

module "application_insights" {
  source = "../../../../infrastructure/terraform/azure/monitoring/application-insights"

  component_name      = var.application_insights_name
  location            = var.location
  resource_group_name = module.resource_group.name
  workspace_id        = module.log_analytics_workspace.id
  application_type    = "web"
  tags                = local.tags
}

resource "azurerm_monitor_workspace" "this" {
  name                = var.monitor_workspace_name
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = local.tags
}

resource "azurerm_dashboard_grafana" "this" {
  name                  = var.grafana_name
  location              = var.location
  resource_group_name   = module.resource_group.name
  grafana_major_version = 11

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}