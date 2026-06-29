variable "policy_name" { type = string }
variable "policy_json" { type = string default = "{\"Version\":\"2012-10-17\",\"Statement\":[]}" }
variable "tags" { type = map(string) default = {} }
