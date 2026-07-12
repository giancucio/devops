variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "admin_password" {
  description = "Value for admin password."
  type        = string
  sensitive   = true
}

variable "admin_username" {
  description = "Value for admin username."
  type        = string
}

variable "namespace_name" {
  description = "Value for namespace name."
  type        = string
}

variable "subnet_ids" {
  description = "Value for subnet ids."
  type        = list(string)
}

variable "workgroup_name" {
  description = "Value for workgroup name."
  type        = string
}
