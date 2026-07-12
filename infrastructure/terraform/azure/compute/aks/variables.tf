variable "clusterName" {
  type    = string
  default = "aks-portfolio"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "dnsPrefix" {
  type    = string
  default = "aks"
}

variable "nodeCount" {
  type    = number
  default = 3
}

variable "nodeVmSize" {
  type    = string
  default = "Standard_DS2_v2"
}

variable "resource_group_name" {
  type    = string
  default = "example-rg"
}
