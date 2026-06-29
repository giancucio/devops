resource "aws_apigatewayv2_api" "this" {
  name          = var.api_name
  protocol_type = "HTTP"
  tags          = var.tags
}

output "api_endpoint" {
  value = aws_apigatewayv2_api.this.api_endpoint
}
