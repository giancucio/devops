variable "name" {
  description = "Name for the resource."
  type        = string
  default     = "portfolio-sample"
}

variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "definition" {
  description = "Value for definition."
  type        = string
}

variable "role_arn" {
  description = "Value for role arn."
  type        = string
}
