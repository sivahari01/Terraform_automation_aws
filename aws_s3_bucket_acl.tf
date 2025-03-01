resource "aws_s3_bucket_policy" "s3buck_policy" {
  bucket = aws_s3_bucket.s3buck.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.s3buck.arn}/*"
      }
    ]
  })
}
