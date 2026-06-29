resource "aws_iam_policy" "rekognition_access" {
  name = var.policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "rekognition:DetectLabels",
          "rekognition:DetectFaces",
          "rekognition:RecognizeCelebrities"
        ]
        Resource = "*"
      }
    ]
  })

  tags = var.tags
}

output "policy_arn" {
  value = aws_iam_policy.rekognition_access.arn
}
