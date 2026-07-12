resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
  tags = var.tags

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

output "cluster_arn" {
  value = aws_ecs_cluster.this.arn
}
