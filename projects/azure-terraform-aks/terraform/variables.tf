variable "environment" {
  description = "Environment name used for tagging (for example: dev, stg, prod)."
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region where resources are deployed."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group for AKS resources."
  type        = string
  default     = "rg-aks-dev-eastus"
}

variable "vnet_name" {
  description = "Name of the virtual network used by the AKS environment."
  type        = string
  default     = "vnet-aks-dev-eastus"
}

variable "vnet_cidr" {
  description = "Address space for the virtual network."
  type        = string
  default     = "10.60.0.0/16"
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster."
  type        = string
  default     = "aks-dev-eastus"
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS API server endpoint."
  type        = string
  default     = "aksdev"
}

variable "node_count" {
  description = "Default node pool node count."
  type        = number
  default     = 3
}

variable "node_vm_size" {
  description = "Default node pool VM SKU."
  type        = string
  default     = "Standard_DS2_v2"
}
