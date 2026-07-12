variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "parameter_name" {
  description = "Value for parameter name."
  type        = string
}

variable "parameter_type" {
  description = "Value for parameter type."
  type        = string
}

variable "parameter_value" {
  description = "Value for parameter value."
  type        = string
  sensitive   = true
}
