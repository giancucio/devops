variable "alertName" {
  type    = string
  default = "metricAlert"
}

variable "targetResourceId" {
  type    = string
  default = "/subscriptions/.../resourceGroups/.../providers/Microsoft.Compute/virtualMachines/..."
}

variable "criteriaValue" {
  type    = number
  default = 80
}

