variable "principal_id" {
  type        = string
  description = "Object ID of the principal receiving the role."
}

variable "role_definition_name" {
  type        = string
  description = "Built-in or custom role definition name."
}

variable "scope" {
  type        = string
  description = "Resource ID defining the assignment scope."
}

variable "principal_type" {
  type        = string
  description = "Type of principal receiving the role."
  default     = null
}

