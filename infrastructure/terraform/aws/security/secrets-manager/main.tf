resource "aws_secretsmanager_secret" "this" {
  name        = var.secret_name
  description = var.description
  kms_key_id  = var.kms_key_id
  tags        = var.tags
}

output "secret_arn" {
  value = aws_secretsmanager_secret.this.arn
}
