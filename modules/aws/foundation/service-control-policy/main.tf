resource "aws_organizations_policy" "this" {
  name        = var.policy_name
  description = "Portfolio service control policy"
  type        = "SERVICE_CONTROL_POLICY"
  content     = var.policy_json
}

output "policy_id" {
  value = aws_organizations_policy.this.id
}
