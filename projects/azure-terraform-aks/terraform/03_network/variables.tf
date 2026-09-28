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

variable "vnet_name" {
  type        = string
  description = "Virtual network name."
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Virtual network address space."
}

variable "aks_subnet_name" {
  type        = string
  description = "AKS subnet name."
}

variable "aks_subnet_prefixes" {
  type        = list(string)
  description = "AKS subnet address prefixes."
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to network resources."
  default     = {}
}