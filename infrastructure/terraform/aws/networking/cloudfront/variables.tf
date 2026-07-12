variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "origin_domain_name" {
  description = "Value for origin domain name."
  type        = string
}
