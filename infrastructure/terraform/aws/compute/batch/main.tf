resource "aws_batch_compute_environment" "this" {
  compute_environment_name = var.name
  type                     = "MANAGED"
  service_role             = var.service_role_arn

  compute_resources {
    type               = "FARGATE"
    max_vcpus          = 16
    subnets            = var.subnet_ids
    security_group_ids = var.security_group_ids
  }
}

output "compute_environment_arn" {
  value = aws_batch_compute_environment.this.arn
}
