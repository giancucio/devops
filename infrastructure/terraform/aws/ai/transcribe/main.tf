resource "aws_iam_policy" "transcribe_access" {
  name = var.policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "transcribe:StartTranscriptionJob",
          "transcribe:GetTranscriptionJob",
          "transcribe:ListTranscriptionJobs"
        ]
        Resource = "*"
      }
    ]
  })

  tags = var.tags
}

output "policy_arn" {
  value = aws_iam_policy.transcribe_access.arn
}
