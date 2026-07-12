variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "hash_key" {
  description = "Value for hash key."
  type        = string
}

variable "table_name" {
  description = "Value for table name."
  type        = string
}
