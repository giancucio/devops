variable "alarm_name" { type = string default = "portfolio-high-cpu" }
variable "metric_name" { type = string default = "CPUUtilization" }
variable "namespace" { type = string default = "AWS/EC2" }
variable "threshold" { type = number default = 80 }
variable "alarm_actions" { type = list(string) default = [] }
variable "tags" { type = map(string) default = {} }
