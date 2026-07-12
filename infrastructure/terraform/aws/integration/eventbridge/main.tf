resource "aws_cloudwatch_event_rule" "this" {
  name                = var.rule_name
  description         = var.description
  schedule_expression = var.schedule_expression
  tags                = var.tags
}

output "rule_arn" {
  value = aws_cloudwatch_event_rule.this.arn
}
