resource "aws_iam_instance_profile" "s3_profile" {
  name = "s3-access-instance-profile"
  role = aws_iam_role.s3_role.name
}
