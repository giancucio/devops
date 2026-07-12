resource "aws_lambda_function" "this" {
  function_name = var.function_name
  role          = var.role_arn
  handler       = var.handler
  runtime       = var.runtime
  filename      = var.filename
  timeout       = var.timeout
  tags          = var.tags
}

output "function_arn" {
  value = aws_lambda_function.this.arn
}
