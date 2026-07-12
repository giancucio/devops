resource "aws_cloudwatch_dashboard" "this" {
  dashboard_name = var.dashboard_name

  dashboard_body = jsonencode({
    widgets = []
  })
}

output "dashboard_name" {
  value = aws_cloudwatch_dashboard.this.dashboard_name
}
