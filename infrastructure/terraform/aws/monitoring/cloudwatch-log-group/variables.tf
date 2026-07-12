variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "log_group_name" {
  description = "Value for log group name."
  type        = string
}

variable "retention_in_days" {
  description = "Value for retention in days."
  type        = number
}
