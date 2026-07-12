variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "dataset_group_name" {
  description = "Value for dataset group name."
  type        = string
}
