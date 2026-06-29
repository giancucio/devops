resource "aws_sns_topic" "this" {
  name = var.topic_name
  tags = var.tags
}

output "topic_arn" {
  value = aws_sns_topic.this.arn
}
