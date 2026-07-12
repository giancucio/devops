variable "factoryName" {
  type    = string
  default = "adf-portfolio"
}

variable "endpointName" {
  type    = string
  default = "mpe-portfolio"
}

variable "privateLinkResourceId" {
  type    = string
  default = "/subscriptions/.../resourceGroups/.../providers/Microsoft.Storage/storageAccounts/..."
}

