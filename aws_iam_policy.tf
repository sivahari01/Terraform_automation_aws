resource "aws_iam_policy" "s3_policy" {
  name        = "S3FullAccessPolicy"
  description = "Policy to grant full access to S3"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:*"
        Resource = "arn:aws:s3:::*"
        Effect   = "Allow"
      },
    ]
  })
}
