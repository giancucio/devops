variable "cluster_name" {
  type        = string
  description = "AKS cluster name."
}

variable "location" {
  type        = string
  description = "Azure region for the AKS cluster."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group containing the cluster."
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS cluster."
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version; null uses the Azure-selected default."
  default     = null
}

variable "sku_tier" {
  type        = string
  description = "AKS pricing tier."
  default     = "Free"
}

variable "system_node_count" {
  type        = number
  description = "Node count for the system node pool."
}

variable "system_node_vm_size" {
  type        = string
  description = "VM size for the system node pool."
}

variable "subnet_id" {
  type        = string
  description = "Subnet resource ID for the system node pool."
}

variable "network_plugin" {
  type        = string
  description = "AKS network plugin."
}

variable "network_plugin_mode" {
  type        = string
  description = "AKS network plugin mode."
}

variable "load_balancer_sku" {
  type        = string
  description = "AKS load balancer SKU."
}

variable "network_policy" {
  type        = string
  description = "AKS network policy implementation."
}

variable "pod_cidr" {
  type        = string
  description = "Pod address range for overlay networking."
}

variable "service_cidr" {
  type        = string
  description = "Kubernetes service address range."
}

variable "dns_service_ip" {
  type        = string
  description = "Cluster DNS service IP."
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Log Analytics workspace resource ID for Container Insights."
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the AKS cluster."
  default     = {}
}
