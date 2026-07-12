resource "aws_elastic_beanstalk_application" "this" {
  name        = var.application_name
  description = var.description
  tags        = var.tags
}

output "application_name" {
  value = aws_elastic_beanstalk_application.this.name
}
