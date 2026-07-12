variable "sqlServerName" {
  type    = string
  default = "sqlserverportfolio"
}

variable "databaseName" {
  type    = string
  default = "sqldb"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "administrator_login" {
  type    = string
  default = "sqladmin"
}
variable "resource_group_name" {
  type    = string
  default = "example-rg"
}

variable "administrator_password" {
  type    = string
  default = "REPLACE_ME"
}
variable "sql_server_version" {
  type    = string
  default = "12.0"
}
