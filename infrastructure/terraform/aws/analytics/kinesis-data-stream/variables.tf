variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "shard_count" {
  description = "Value for shard count."
  type        = number
}

variable "stream_name" {
  description = "Value for stream name."
  type        = string
}
