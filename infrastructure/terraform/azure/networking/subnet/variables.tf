variable "vnetName" {
  type    = string
  default = "vnet-portfolio"
}

variable "subnetName" {
  type    = string
  default = "subnet1"
}

variable "addressPrefix" {
  type    = string
  default = "10.0.1.0/24"
}

variable "location" {
  type    = string
  default = "eastus"
}
variable "resource_group_name" {
  type    = string
  default = "example-rg"
}
