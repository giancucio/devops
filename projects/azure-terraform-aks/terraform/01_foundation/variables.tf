variable "subscription_id" {
  type        = string
  description = "Azure subscription ID."
}

variable "location" {
  type        = string
  description = "Azure region for the foundation resources."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "Log Analytics workspace name."
}

variable "application_insights_name" {
  type        = string
  description = "Application Insights component name."
}

variable "monitor_workspace_name" {
  type        = string
  description = "Azure Monitor workspace name."
}

variable "grafana_name" {
  type        = string
  description = "Azure Managed Grafana name."
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to resources."
  default     = {}
}