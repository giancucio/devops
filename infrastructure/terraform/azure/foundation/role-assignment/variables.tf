variable "principalId" {
  type    = string
  default = "00000000-0000-0000-0000-000000000000"
}

variable "roleDefinitionId" {
  type    = string
  default = "/subscriptions/.../providers/Microsoft.Authorization/roleDefinitions/..."
}

variable "scope" {
  type    = string
  default = "/subscriptions/<subscriptionId>"
}

