variable "name" {
  description = "Name for the resource."
  type        = string
  default     = "portfolio-sample"
}

variable "security_group_ids" {
  description = "Value for security group ids."
  type        = list(string)
}

variable "service_role_arn" {
  description = "Value for service role arn."
  type        = string
}

variable "subnet_ids" {
  description = "Value for subnet ids."
  type        = list(string)
}
