resource "aws_guardduty_detector" "this" {
  enable = true
  tags   = var.tags
}

output "detector_id" {
  value = aws_guardduty_detector.this.id
}
