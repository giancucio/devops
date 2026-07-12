variable "policy_name" {
  type    = string
  default = "portfolio-scp"
}
variable "policy_json" {
  type    = string
  default = "{\"Version\":\"2012-10-17\",\"Statement\":[]}"
}
