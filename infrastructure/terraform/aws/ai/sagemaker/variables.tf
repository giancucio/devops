variable "tags" {
  description = "Common tags."
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "devops"
  }
}

variable "notebook_name" {
  description = "Name of the SageMaker notebook instance."
  type        = string
}

variable "role_arn" {
  description = "ARN of the IAM role used by the notebook instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type used by the notebook instance."
  type        = string
}

