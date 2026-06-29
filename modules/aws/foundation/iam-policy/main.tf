resource "aws_iam_policy" "this" {
  name        = var.policy_name
  description = "Portfolio IAM policy"
  policy      = var.policy_json
  tags        = var.tags
}

output "policy_arn" {
  value = aws_iam_policy.this.arn
}
