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

variable "desired_size" {
  description = "Value for desired size."
  type        = number
}

variable "instance_types" {
  description = "Value for instance types."
  type        = list(string)
}

variable "max_size" {
  description = "Value for max size."
  type        = number
}

variable "min_size" {
  description = "Value for min size."
  type        = number
}

variable "node_group_name" {
  description = "Value for node group name."
  type        = string
}

variable "node_role_arn" {
  description = "Value for node role arn."
  type        = string
}

variable "subnet_ids" {
  description = "Value for subnet ids."
  type        = list(string)
}
