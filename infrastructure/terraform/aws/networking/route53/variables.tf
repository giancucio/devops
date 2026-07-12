variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "zone_name" {
  description = "Value for zone name."
  type        = string
}
