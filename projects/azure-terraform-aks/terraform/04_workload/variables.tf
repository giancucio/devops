variable "subscription_id" {
  type        = string
  description = "Azure subscription ID."
}

variable "environment" {
  type        = string
  description = "Environment name used in remote-state keys."
}

variable "tfstate_resource_group_name" {
  type        = string
  description = "Resource group containing Terraform state storage."
}

variable "tfstate_storage_account_name" {
  type        = string
  description = "Storage account containing Terraform state."
}

variable "tfstate_container_name" {
  type        = string
  description = "Blob container containing Terraform state."
}

variable "acr_name" {
  type        = string
  description = "Globally unique Azure Container Registry name."
}

variable "aks_name" {
  type        = string
  description = "AKS cluster name."
}

variable "dns_prefix" {
  type        = string
  description = "AKS cluster DNS prefix."
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version; null lets Azure select the default."
  default     = null
}

variable "system_node_count" {
  type        = number
  description = "Node count for the AKS system pool."
}

variable "system_node_vm_size" {
  type        = string
  description = "VM size for the AKS system pool."
}

variable "network_profile" {
  description = "AKS network configuration."
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

variable "tags" {
  type        = map(string)
  description = "Tags applied to workload resources."
  default     = {}
}