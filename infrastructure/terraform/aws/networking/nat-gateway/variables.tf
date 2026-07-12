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

variable "public_subnet_id" {
  description = "Value for public subnet id."
  type        = string
}
