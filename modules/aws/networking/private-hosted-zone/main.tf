resource "aws_route53_zone" "this" {
  name = var.zone_name

  vpc {
    vpc_id = var.vpc_id
  }

  tags = var.tags
}

output "zone_id" {
  value = aws_route53_zone.this.zone_id
}
