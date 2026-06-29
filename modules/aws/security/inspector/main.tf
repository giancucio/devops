resource "aws_inspector2_enabler" "this" {
  account_ids    = var.account_ids
  resource_types = ["EC2", "ECR", "LAMBDA"]
}

output "enabled_resource_types" {
  value = aws_inspector2_enabler.this.resource_types
}
