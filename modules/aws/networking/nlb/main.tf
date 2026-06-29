resource "aws_lb" "this" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = "network"
  subnets            = var.subnet_ids
  tags               = var.tags
}

output "nlb_arn" {
  value = aws_lb.this.arn
}
