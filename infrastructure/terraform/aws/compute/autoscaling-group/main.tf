resource "aws_autoscaling_group" "this" {
  name                = var.name
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.this.name
}
