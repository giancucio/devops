resource "aws_redshift_cluster" "this" {
  cluster_identifier = var.cluster_identifier
  database_name      = var.database_name
  master_username    = var.username
  master_password    = var.password
  node_type          = var.node_type
  cluster_type       = "single-node"
  skip_final_snapshot = true
  tags               = var.tags
}

output "endpoint" {
  value = aws_redshift_cluster.this.endpoint
}
