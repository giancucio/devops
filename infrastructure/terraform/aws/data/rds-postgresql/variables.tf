variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "allocated_storage" {
  description = "Value for allocated storage."
  type        = number
}

variable "database_name" {
  description = "Value for database name."
  type        = string
}

variable "db_subnet_group_name" {
  description = "Value for db subnet group name."
  type        = string
}

variable "engine_version" {
  description = "Value for engine version."
  type        = string
}

variable "identifier" {
  description = "Value for identifier."
  type        = string
}

variable "instance_class" {
  description = "Value for instance class."
  type        = string
}

variable "password" {
  description = "Value for password."
  type        = string
  sensitive   = true
}

variable "security_group_ids" {
  description = "Value for security group ids."
  type        = list(string)
}

variable "username" {
  description = "Value for username."
  type        = string
}
