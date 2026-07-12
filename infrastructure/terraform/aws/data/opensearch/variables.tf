variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "domain_name" {
  description = "Value for domain name."
  type        = string
}

variable "instance_type" {
  description = "Value for instance type."
  type        = string
}
