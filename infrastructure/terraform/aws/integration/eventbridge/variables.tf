variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "description" {
  description = "Value for description."
  type        = string
}

variable "rule_name" {
  description = "Value for rule name."
  type        = string
}

variable "schedule_expression" {
  description = "Value for schedule expression."
  type        = string
}
