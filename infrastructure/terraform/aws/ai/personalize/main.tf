resource "aws_personalize_dataset_group" "this" {
  name = var.dataset_group_name
  tags = var.tags
}

output "dataset_group_arn" {
  value = aws_personalize_dataset_group.this.arn
}
