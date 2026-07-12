resource "aws_apigatewayv2_integration" "this" {
  api_id                 = var.api_id
  integration_type       = "AWS_PROXY"
  integration_uri        = var.lambda_invoke_arn
  payload_format_version = "2.0"
}

output "integration_id" {
  value = aws_apigatewayv2_integration.this.id
}
