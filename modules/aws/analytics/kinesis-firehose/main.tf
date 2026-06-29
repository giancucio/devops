resource "aws_kinesis_firehose_delivery_stream" "this" {
  name        = var.stream_name
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = var.role_arn
    bucket_arn = var.bucket_arn
  }

  tags = var.tags
}

output "stream_arn" {
  value = aws_kinesis_firehose_delivery_stream.this.arn
}
