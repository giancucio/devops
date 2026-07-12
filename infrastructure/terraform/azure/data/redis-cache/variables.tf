variable "redisName" {
  type    = string
  default = "redis-portfolio"
}

variable "resource_group_name" {
  type    = string
  default = "example-rg"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "skuName" {
  type    = string
  default = "Standard"
}

variable "capacity" {
  type    = number
  default = 1
}
variable "family" {
  type    = string
  default = "C"
}
variable "sku_name" {
  type    = string
  default = "Standard"
}
