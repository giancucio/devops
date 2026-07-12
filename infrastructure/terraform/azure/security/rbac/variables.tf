variable "roleName" {
  type    = string
  default = "CustomRole"
}

variable "description" {
  type    = string
  default = "Custom role definition"
}

variable "permissions" {
  type    = list(any)
  default = [""]
}

variable "assignableScopes" {
  type    = list(any)
  default = ["/subscriptions/<subscriptionId>"]
}

