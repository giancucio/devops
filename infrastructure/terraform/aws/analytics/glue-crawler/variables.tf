variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "crawler_name" {
  description = "Value for crawler name."
  type        = string
}

variable "database_name" {
  description = "Value for database name."
  type        = string
}

variable "role_arn" {
  description = "Value for role arn."
  type        = string
}

variable "s3_target_path" {
  description = "Value for s3 target path."
  type        = string
}
