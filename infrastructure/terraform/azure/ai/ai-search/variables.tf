variable "searchServiceName" {
  type    = string
  default = "search-portfolio"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "skuName" {
  type    = string
  default = "standard"
}

variable "replicaCount" {
  type    = number
  default = 1
}

variable "partitionCount" {
  type    = number
  default = 1
}

