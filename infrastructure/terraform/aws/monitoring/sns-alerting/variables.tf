variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "topic_name" {
  description = "Value for topic name."
  type        = string
}
