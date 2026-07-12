variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "cluster_name" {
  description = "Value for cluster name."
  type        = string
}

variable "instance_profile" {
  description = "Value for instance profile."
  type        = string
}

variable "instance_type" {
  description = "Value for instance type."
  type        = string
}

variable "release_label" {
  description = "Value for release label."
  type        = string
}

variable "service_role_arn" {
  description = "Value for service role arn."
  type        = string
}

variable "subnet_id" {
  description = "Value for subnet id."
  type        = string
}
