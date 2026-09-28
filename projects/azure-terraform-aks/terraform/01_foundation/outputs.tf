output "resource_group_name" {
  value = module.resource_group.name
}

output "location" {
  value = module.resource_group.location
}

output "log_analytics_workspace_id" {
  value = module.log_analytics_workspace.id
}

output "application_insights_name" {
  value = module.application_insights.name
}

output "application_insights_connection_string" {
  value     = module.application_insights.connection_string
  sensitive = true
}

output "monitor_workspace_id" {
  value = azurerm_monitor_workspace.this.id
}

output "grafana_id" {
  value = azurerm_dashboard_grafana.this.id
}