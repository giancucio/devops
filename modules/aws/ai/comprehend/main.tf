resource "aws_iam_policy" "comprehend_access" {
  name = var.policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "comprehend:DetectSentiment",
          "comprehend:DetectEntities",
          "comprehend:DetectKeyPhrases"
        ]
        Resource = "*"
      }
    ]
  })

  tags = var.tags
}

output "policy_arn" {
  value = aws_iam_policy.comprehend_access.arn
}
