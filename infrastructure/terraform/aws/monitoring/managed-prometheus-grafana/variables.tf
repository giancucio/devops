variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "grafana_workspace_name" {
  description = "Value for grafana workspace name."
  type        = string
}

variable "workspace_alias" {
  description = "Value for workspace alias."
  type        = string
}
