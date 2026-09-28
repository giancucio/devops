variable "key_vault_name" {
  type        = string
  description = "Globally unique Key Vault name."
}

variable "location" {
  type        = string
  description = "Azure region for the Key Vault."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group containing the Key Vault."
}

variable "tenant_id" {
  type        = string
  description = "Microsoft Entra tenant ID for the Key Vault."
}

variable "sku_name" {
  type        = string
  description = "Key Vault SKU."
  default     = "standard"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the Key Vault."
  default     = {}
}
