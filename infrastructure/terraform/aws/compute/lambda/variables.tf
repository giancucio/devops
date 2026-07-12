variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "filename" {
  description = "Value for filename."
  type        = string
}

variable "function_name" {
  description = "Value for function name."
  type        = string
}

variable "handler" {
  description = "Value for handler."
  type        = string
}

variable "role_arn" {
  description = "Value for role arn."
  type        = string
}

variable "runtime" {
  description = "Value for runtime."
  type        = string
}

variable "timeout" {
  description = "Value for timeout."
  type        = number
}
