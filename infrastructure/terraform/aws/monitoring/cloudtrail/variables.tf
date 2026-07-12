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

variable "s3_bucket_name" {
  description = "Value for s3 bucket name."
  type        = string
}
