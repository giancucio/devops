resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = 300
  statistic           = "Average"
  threshold           = var.threshold
  alarm_actions       = var.alarm_actions
  tags                = var.tags
}

output "alarm_arn" {
  value = aws_cloudwatch_metric_alarm.this.arn
}
