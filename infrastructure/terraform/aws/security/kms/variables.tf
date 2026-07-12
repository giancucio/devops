variable "alias_name" {
  type    = string
  default = "portfolio-key"
}
variable "description" {
  type    = string
  default = "Portfolio KMS key"
}
variable "tags" {
  type    = map(string)
  default = {}
}
