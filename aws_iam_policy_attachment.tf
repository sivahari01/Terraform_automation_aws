resource "aws_iam_policy_attachment" "s3_full_access" {
  name       = "s3-full-access-attachment"
  roles      = [aws_iam_role.s3_access_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
