resource "aws_sagemaker_notebook_instance" "this" {
  name          = var.notebook_name
  role_arn      = var.role_arn
  instance_type = var.instance_type
  tags          = var.tags
}

output "notebook_arn" {
  value = aws_sagemaker_notebook_instance.this.arn
}
