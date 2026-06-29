variable "role_name" { type = string }
variable "trusted_service" { type = string default = "ec2.amazonaws.com" }
variable "tags" { type = map(string) default = {} }
