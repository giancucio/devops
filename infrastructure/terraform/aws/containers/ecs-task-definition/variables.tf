variable "container_definitions" {
  description = "Value for container definitions."
  type        = string
}

variable "cpu" {
  description = "Value for cpu."
  type        = number
}

variable "execution_role_arn" {
  description = "Value for execution role arn."
  type        = string
}

variable "family" {
  description = "Value for family."
  type        = string
}

variable "memory" {
  description = "Value for memory."
  type        = number
}

variable "task_role_arn" {
  description = "Value for task role arn."
  type        = string
}
