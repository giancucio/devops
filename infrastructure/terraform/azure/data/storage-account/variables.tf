variable "storageAccountName" {
  type    = string
  default = "stgacctportfolio"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "skuName" {
  type    = string
  default = "Standard_LRS"
}

variable "account_tier" {
  type    = string
  default = "Standard"
}
variable "account_replication_type" {
  type    = string
  default = "LRS"
}
variable "resource_group_name" {
  type    = string
  default = "example-rg"
}
