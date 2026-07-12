variable "zoneName" {
  type    = string
  default = "privatelinkzone"
}

variable "linkName" {
  type    = string
  default = "vnet-link"
}

variable "virtualNetworkId" {
  type    = string
  default = "/subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/..."
}

