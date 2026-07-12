variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "job_name" {
  description = "Value for job name."
  type        = string
}

variable "role_arn" {
  description = "Value for role arn."
  type        = string
}

variable "script_location" {
  description = "Value for script location."
  type        = string
}
