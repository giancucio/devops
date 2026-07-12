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

variable "cluster_role_arn" {
  description = "Value for cluster role arn."
  type        = string
}

variable "kubernetes_version" {
  description = "Value for kubernetes version."
  type        = string
}

variable "subnet_ids" {
  description = "Value for subnet ids."
  type        = list(string)
}
