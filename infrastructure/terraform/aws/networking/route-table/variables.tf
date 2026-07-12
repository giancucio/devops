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

variable "gateway_id" {
  description = "Value for gateway id."
  type        = string
}

variable "vpc_id" {
  description = "Value for vpc id."
  type        = string
}
