variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "vpc_id" {
  description = "Value for vpc id."
  type        = string
}

variable "zone_name" {
  description = "Value for zone name."
  type        = string
}
