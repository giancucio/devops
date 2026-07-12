resource "aws_xray_sampling_rule" "this" {
  rule_name      = var.rule_name
  priority       = 1000
  version        = 1
  reservoir_size = 1
  fixed_rate     = 0.05
  url_path       = "*"
  host           = "*"
  http_method    = "*"
  service_type   = "*"
  service_name   = "*"
  resource_arn   = "*"
}

output "rule_name" {
  value = aws_xray_sampling_rule.this.rule_name
}
