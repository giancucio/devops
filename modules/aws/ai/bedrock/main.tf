# Bedrock foundation model access is account/region dependent.
# This example stores an IAM policy for Bedrock invocation.

resource "aws_iam_policy" "bedrock_invoke" {
  name = var.policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "bedrock:InvokeModel",
          "bedrock:InvokeModelWithResponseStream"
        ]
        Resource = "*"
      }
    ]
  })

  tags = var.tags
}

output "policy_arn" {
  value = aws_iam_policy.bedrock_invoke.arn
}
