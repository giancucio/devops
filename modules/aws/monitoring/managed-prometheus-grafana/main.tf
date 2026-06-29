resource "aws_prometheus_workspace" "this" {
  alias = var.workspace_alias
  tags  = var.tags
}

resource "aws_grafana_workspace" "this" {
  account_access_type      = "CURRENT_ACCOUNT"
  authentication_providers = ["AWS_SSO"]
  permission_type          = "SERVICE_MANAGED"
  name                     = var.grafana_workspace_name
  tags                     = var.tags
}

output "prometheus_workspace_id" {
  value = aws_prometheus_workspace.this.id
}

output "grafana_workspace_id" {
  value = aws_grafana_workspace.this.id
}
