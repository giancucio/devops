resource "aws_iam_policy" "polly_access" {
  name = var.policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "polly:SynthesizeSpeech",
          "polly:DescribeVoices",
          "polly:ListLexicons"
        ]
        Resource = "*"
      }
    ]
  })

  tags = var.tags
}

output "policy_arn" {
  value = aws_iam_policy.polly_access.arn
}
