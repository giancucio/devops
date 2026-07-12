variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "application_name" {
  description = "Value for application name."
  type        = string
}

variable "description" {
  description = "Value for description."
  type        = string
}
