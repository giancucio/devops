variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "bucket_arn" {
  description = "Value for bucket arn."
  type        = string
}

variable "role_arn" {
  description = "Value for role arn."
  type        = string
}

variable "stream_name" {
  description = "Value for stream name."
  type        = string
}
