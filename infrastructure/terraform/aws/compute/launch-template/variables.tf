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

variable "ami_id" {
  description = "Value for ami id."
  type        = string
}

variable "instance_type" {
  description = "Value for instance type."
  type        = string
}
