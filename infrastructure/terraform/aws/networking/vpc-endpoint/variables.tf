variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "endpoint_type" {
  description = "Value for endpoint type."
  type        = string
}

variable "private_dns_enabled" {
  description = "Value for private dns enabled."
  type        = bool
}

variable "security_group_ids" {
  description = "Value for security group ids."
  type        = list(string)
}

variable "service_name" {
  description = "Value for service name."
  type        = string
}

variable "subnet_ids" {
  description = "Value for subnet ids."
  type        = list(string)
}

variable "vpc_id" {
  description = "Value for vpc id."
  type        = string
}
