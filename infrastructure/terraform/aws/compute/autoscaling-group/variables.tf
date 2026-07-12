variable "name" {
  description = "Name for the resource."
  type        = string
  default     = "portfolio-sample"
}

variable "desired_capacity" {
  description = "Value for desired capacity."
  type        = number
}

variable "launch_template_id" {
  description = "Value for launch template id."
  type        = string
}

variable "max_size" {
  description = "Value for max size."
  type        = number
}

variable "min_size" {
  description = "Value for min size."
  type        = number
}

variable "subnet_ids" {
  description = "Value for subnet ids."
  type        = list(string)
}
