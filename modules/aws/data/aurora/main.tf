resource "aws_rds_cluster" "this" {
  cluster_identifier     = var.cluster_identifier
  engine                 = "aurora-postgresql"
  database_name          = var.database_name
  master_username        = var.username
  master_password        = var.password
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.security_group_ids
  skip_final_snapshot    = true
  tags                   = var.tags
}

output "cluster_endpoint" {
  value = aws_rds_cluster.this.endpoint
}
