variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "role_name" {
  description = "Value for role name."
  type        = string
}

variable "trusted_service" {
  description = "Value for trusted service."
  type        = string
}
