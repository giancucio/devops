variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "index_name" {
  description = "Value for index name."
  type        = string
}

variable "role_arn" {
  description = "Value for role arn."
  type        = string
}
