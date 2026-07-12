variable "name" {
  type    = string
  default = "portfolio-vpc"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "tags" {
  type    = map(string)
  default = {}
}
