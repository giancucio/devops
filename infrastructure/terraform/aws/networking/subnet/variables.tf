variable "name" {
  type    = string
  default = "portfolio-subnet"
}
variable "vpc_id" { type = string }
variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}
variable "availability_zone" {
  type    = string
  default = "ap-northeast-1a"
}
variable "map_public_ip_on_launch" {
  type    = bool
  default = false
}
variable "tags" {
  type    = map(string)
  default = {}
}
