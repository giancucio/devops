variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "description" {
  description = "Value for description."
  type        = string
}

variable "kms_key_id" {
  description = "Value for kms key id."
  type        = string
}

variable "secret_name" {
  description = "Value for secret name."
  type        = string
}
