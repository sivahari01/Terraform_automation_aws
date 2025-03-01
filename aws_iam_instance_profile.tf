resource "aws_iam_instance_profile" "s3_instance_profile" {
  name = "EC2-S3-Instance-Profile"
  role = aws_iam_role.s3_role.name
}
