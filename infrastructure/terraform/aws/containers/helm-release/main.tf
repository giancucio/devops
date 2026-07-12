resource "helm_release" "this" {
  name       = var.release_name
  repository = var.repository
  chart      = var.chart
  namespace  = var.namespace
  version    = var.chart_version
}

output "release_name" {
  value = helm_release.this.name
}
