resource "aws_iam_instance_profile" "s3_profile" {
  name = "s3-instance-profile"
  role = aws_iam_role.s3_access_role.name
}
