variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "cluster_arn" {
  description = "Value for cluster arn."
  type        = string
}

variable "desired_count" {
  description = "Value for desired count."
  type        = number
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

variable "task_definition_arn" {
  description = "Value for task definition arn."
  type        = string
}
