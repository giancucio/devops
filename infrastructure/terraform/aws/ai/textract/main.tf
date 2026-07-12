resource "aws_iam_policy" "textract_access" {
  name = var.policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "textract:DetectDocumentText",
          "textract:AnalyzeDocument",
          "textract:StartDocumentAnalysis"
        ]
        Resource = "*"
      }
    ]
  })

  tags = var.tags
}

output "policy_arn" {
  value = aws_iam_policy.textract_access.arn
}
