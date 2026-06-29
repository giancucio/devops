resource "aws_api_gateway_rest_api" "this" {
  name        = var.api_name
  description = var.description
  tags        = var.tags
}

output "rest_api_id" {
  value = aws_api_gateway_rest_api.this.id
}
