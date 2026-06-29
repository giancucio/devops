resource "aws_network_acl" "this" {
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids
  tags       = var.tags
}

output "network_acl_id" {
  value = aws_network_acl.this.id
}
