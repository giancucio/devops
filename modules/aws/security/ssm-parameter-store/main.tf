resource "aws_ssm_parameter" "this" {
  name  = var.parameter_name
  type  = var.parameter_type
  value = var.parameter_value
  tags  = var.tags
}

output "parameter_arn" {
  value = aws_ssm_parameter.this.arn
}
