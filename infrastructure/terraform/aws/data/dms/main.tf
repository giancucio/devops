resource "aws_dms_replication_subnet_group" "this" {
  replication_subnet_group_id          = var.name
  replication_subnet_group_description = "Portfolio DMS subnet group"
  subnet_ids                           = var.subnet_ids
  tags                                 = var.tags
}

output "subnet_group_id" {
  value = aws_dms_replication_subnet_group.this.id
}
