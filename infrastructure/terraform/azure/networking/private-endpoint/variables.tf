variable "privateEndpointName" {
  type    = string
  default = "pe-portfolio"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "subnetId" {
  type    = string
  default = "/subscriptions/.../resourceGroups/.../providers/Microsoft.Network/virtualNetworks/.../subnets/..."
}

variable "privateLinkServiceId" {
  type    = string
  default = "/subscriptions/.../resourceGroups/.../providers/Microsoft.Network/privateLinkServices/..."
}

