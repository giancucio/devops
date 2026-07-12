variable "vnetName" {
  type    = string
  default = "vnet-portfolio"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "addressPrefix" {
  type    = string
  default = "10.0.0.0/16"
}

variable "resource_group_name" {
  type    = string
  default = "example-rg"
}
