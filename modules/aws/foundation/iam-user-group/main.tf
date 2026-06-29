resource "aws_iam_group" "this" {
  name = var.group_name
}

resource "aws_iam_group_policy_attachment" "readonly" {
  group      = aws_iam_group.this.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

output "group_name" {
  value = aws_iam_group.this.name
}
