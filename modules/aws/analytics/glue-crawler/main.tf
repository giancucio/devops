resource "aws_glue_crawler" "this" {
  name          = var.crawler_name
  role          = var.role_arn
  database_name = var.database_name

  s3_target {
    path = var.s3_target_path
  }

  tags = var.tags
}

output "crawler_name" {
  value = aws_glue_crawler.this.name
}
