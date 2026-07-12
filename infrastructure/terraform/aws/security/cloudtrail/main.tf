resource "aws_cloudtrail" "this" {
  name                          = var.name
  s3_bucket_name                = var.s3_bucket_name
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
  tags                          = var.tags
}

output "cloudtrail_arn" {
  value = aws_cloudtrail.this.arn
}
