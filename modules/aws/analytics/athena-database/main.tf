resource "aws_athena_database" "this" {
  name   = var.database_name
  bucket = var.bucket_name
}

output "database_name" {
  value = aws_athena_database.this.name
}
