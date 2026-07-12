# Generic Terraform scaffold for AWS Account Baseline.
# Replace this null_resource with the target AWS resource as the module matures.

resource "null_resource" "this" {
  triggers = {
    module_name = "account-baseline"
    category    = "foundation"
    name        = var.name
  }
}

output "id" {
  value = null_resource.this.id
}
