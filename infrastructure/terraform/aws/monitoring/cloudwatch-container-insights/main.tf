resource "aws_ecs_cluster" "this" {
  name = var.cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = var.tags
}

output "cluster_arn" {
  value = aws_ecs_cluster.this.arn
}
