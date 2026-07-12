variable "assignmentName" {
  type    = string
  default = "policyAssignment"
}

variable "policyDefinitionId" {
  type    = string
  default = "/subscriptions/.../providers/Microsoft.Authorization/policyDefinitions/..."
}

variable "scope" {
  type    = string
  default = "/subscriptions/<subscriptionId>"
}

