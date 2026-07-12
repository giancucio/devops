resource "aws_lakeformation_data_lake_settings" "this" {
  admins = var.admin_arns
}

output "admins" {
  value = aws_lakeformation_data_lake_settings.this.admins
}
