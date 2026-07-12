variable "name" {
  type    = string
  default = "portfolio-sg"
}
variable "description" {
  type    = string
  default = "Portfolio security group"
}
variable "vpc_id" { type = string }
variable "tags" {
  type    = map(string)
  default = {}
}
