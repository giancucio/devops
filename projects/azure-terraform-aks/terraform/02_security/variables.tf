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

variable "key_vault_name" {
  type        = string
  description = "Globally unique Key Vault name."
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the Key Vault."
  default     = {}
}