variable "database_name" {
  description = "Name of the Athena database."
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket used by the Athena database."
  type        = string
}
