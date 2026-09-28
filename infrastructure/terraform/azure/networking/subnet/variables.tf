variable "virtual_network_name" {
  type        = string
  description = "Virtual network containing the subnet."
}

variable "subnet_name" {
  type        = string
  description = "Subnet name."
}

variable "address_prefixes" {
  type        = list(string)
  description = "Address prefixes assigned to the subnet."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group containing the virtual network."
}
