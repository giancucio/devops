variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "api_name" {
  description = "Value for api name."
  type        = string
}

variable "description" {
  description = "Value for description."
  type        = string
}
