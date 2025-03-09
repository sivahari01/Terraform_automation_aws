resource "aws_iam_instance_profile" "s3_profile" {
  name = "my-instance-profile"
  role = "Ec2_S3"
}
