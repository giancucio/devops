variable "lockName" {
  type    = string
  default = "readOnlyLock"
}

variable "lockLevel" {
  type    = string
  default = "CanNotDelete"
}

variable "notes" {
  type    = string
  default = "Protect resource"
}

