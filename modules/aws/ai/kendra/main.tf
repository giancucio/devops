resource "aws_kendra_index" "this" {
  name     = var.index_name
  role_arn = var.role_arn
  edition  = "DEVELOPER_EDITION"
  tags     = var.tags
}

output "index_id" {
  value = aws_kendra_index.this.id
}
