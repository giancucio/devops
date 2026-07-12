variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "policy_name" {
  description = "Name of the IAM policy that grants Bedrock model invocation."
  type        = string
}

