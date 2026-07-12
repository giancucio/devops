variable "storageAccountName" {
  type    = string
  default = "stgacctportfolio"
}

variable "containerName" {
  type    = string
  default = "data"
}

variable "location" {
  type    = string
  default = "eastus"
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
