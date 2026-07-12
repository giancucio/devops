resource "aws_opensearch_domain" "this" {
  domain_name    = var.domain_name
  engine_version = "OpenSearch_2.11"

  cluster_config {
    instance_type  = var.instance_type
    instance_count = 1
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }

  tags = var.tags
}

output "endpoint" {
  value = aws_opensearch_domain.this.endpoint
}
