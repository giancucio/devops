variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "subnet_ids" {
  description = "Value for subnet ids."
  type        = list(string)
}

variable "vpc_id" {
  description = "Value for vpc id."
  type        = string
}
