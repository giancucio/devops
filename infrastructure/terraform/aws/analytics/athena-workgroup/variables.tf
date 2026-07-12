variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "output_location" {
  description = "Value for output location."
  type        = string
}

variable "workgroup_name" {
  description = "Value for workgroup name."
  type        = string
}
