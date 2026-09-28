variable "vnet_name" {
  type        = string
  description = "Virtual network name."
}

variable "location" {
  type        = string
  description = "Azure region for the virtual network."
}

variable "address_space" {
  type        = list(string)
  description = "Address spaces assigned to the virtual network."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group containing the virtual network."
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the virtual network."
  default     = {}
}
