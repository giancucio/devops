variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "eastus"
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "VNet CIDR"
  default     = ["10.60.0.0/16"]
}

variable "aks_subnet_name" {
  type        = string
  description = "AKS subnet name"
}

variable "aks_subnet_prefixes" {
  type        = list(string)
  description = "AKS subnet CIDR"
  default     = ["10.60.1.0/24"]
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "Log Analytics workspace name"
}

variable "acr_name" {
  type        = string
  description = "Azure Container Registry name (globally unique, alphanumeric)"
}

variable "aks_name" {
  type        = string
  description = "AKS cluster name"
}

variable "dns_prefix" {
  type        = string
  description = "AKS DNS prefix"
}

variable "kubernetes_version" {
  type        = string
  description = "AKS Kubernetes version. Null lets AKS select the current default."
  default     = null
}

variable "system_node_count" {
  type        = number
  description = "System node pool node count"
  default     = 3
}

variable "system_node_vm_size" {
  type        = string
  description = "VM size for system node pool"
  default     = "Standard_DS2_v2"
}

variable "network_profile" {
  description = "AKS network configuration"
  type = object({
    network_plugin      = string
    network_plugin_mode = string
    load_balancer_sku   = string
    network_policy      = string
    pod_cidr            = string
    service_cidr        = string
    dns_service_ip      = string
  })
}

variable "application_insights_name" {
  type        = string
  description = "Application Insights resource name"
}

variable "monitor_workspace_name" {
  type        = string
  description = "Azure Monitor workspace name for managed Prometheus"
}

variable "grafana_name" {
  type        = string
  description = "Azure Managed Grafana name"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources"
  default = {
    environment = "dev"
    project     = "azure-terraform-aks"
  }
}
