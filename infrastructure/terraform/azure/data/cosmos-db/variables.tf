variable "accountName" {
  type    = string
  default = "cosmos-portfolio"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "databaseName" {
  type    = string
  default = "db1"
}

variable "offer_type" {
  type    = string
  default = "Standard"
}
variable "consistency_level" {
  type    = string
  default = "Session"
}
variable "resource_group_name" {
  type    = string
  default = "example-rg"
}
