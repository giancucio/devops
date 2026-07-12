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

variable "internal" {
  description = "Value for internal."
  type        = bool
}

variable "subnet_ids" {
  description = "Value for subnet ids."
  type        = list(string)
}
