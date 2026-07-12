variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "cluster_identifier" {
  description = "Value for cluster identifier."
  type        = string
}

variable "database_name" {
  description = "Value for database name."
  type        = string
}

variable "node_type" {
  description = "Value for node type."
  type        = string
}

variable "password" {
  description = "Value for password."
  type        = string
  sensitive   = true
}

variable "username" {
  description = "Value for username."
  type        = string
}
