resource "aws_launch_template" "this" {
  name_prefix   = "${var.name}-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }
}

output "launch_template_id" {
  value = aws_launch_template.this.id
}
