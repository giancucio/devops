variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "destination_bucket_name" {
  description = "Value for destination bucket name."
  type        = string
}

variable "flow_name" {
  description = "Value for flow name."
  type        = string
}

variable "source_bucket_name" {
  description = "Value for source bucket name."
  type        = string
}

variable "source_bucket_prefix" {
  description = "Value for source bucket prefix."
  type        = string
}
