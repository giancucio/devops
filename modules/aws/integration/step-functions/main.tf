resource "aws_sfn_state_machine" "this" {
  name     = var.name
  role_arn = var.role_arn
  definition = var.definition
  tags     = var.tags
}

output "state_machine_arn" {
  value = aws_sfn_state_machine.this.arn
}
