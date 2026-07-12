variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "cluster_name" {
  description = "Value for cluster name."
  type        = string
}
