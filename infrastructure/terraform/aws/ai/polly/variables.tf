variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "policy_name" {
  description = "Value for policy name."
  type        = string
}
