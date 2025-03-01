resource "aws_iam_policy" "s3_policy" {
  name        = "s3_full_access_policy"
  description = "Policy to allow EC2 instance to access S3"
  
  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "s3:*",
        "Resource": "*"
      }
    ]
  }
  EOF
}
