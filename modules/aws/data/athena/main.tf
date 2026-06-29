resource "aws_athena_workgroup" "this" {
  name = var.workgroup_name

  configuration {
    result_configuration {
      output_location = var.output_location
    }
  }

  tags = var.tags
}

output "workgroup_name" {
  value = aws_athena_workgroup.this.name
}
