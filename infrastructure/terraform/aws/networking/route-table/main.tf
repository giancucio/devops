resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_route" "default" {
  count                  = var.gateway_id == "" ? 0 : 1
  route_table_id         = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.gateway_id
}

output "route_table_id" {
  value = aws_route_table.this.id
}
