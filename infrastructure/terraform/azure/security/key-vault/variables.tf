variable "keyVaultName" {
  type    = string
  default = "kv-portfolio"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "tenantId" {
  type    = string
  default = "00000000-0000-0000-0000-000000000000"
}

variable "sku_name" {
  type    = string
  default = "standard"
}
variable "resource_group_name" {
  type    = string
  default = "example-rg"
}
