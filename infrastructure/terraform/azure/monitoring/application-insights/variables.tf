variable "component_name" {
  type        = string
  description = "Application Insights component name."
}

variable "location" {
  type        = string
  description = "Azure region for the component."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group containing the component."
}

variable "workspace_id" {
  type        = string
  description = "Log Analytics workspace resource ID."
}

variable "application_type" {
  type        = string
  description = "Application type reported by Application Insights."
  default     = "web"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the component."
  default     = {}
}

