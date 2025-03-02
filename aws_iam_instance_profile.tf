# Fetch existing IAM instance profile if it exists
data "aws_iam_instance_profile" "existing_s3_profile" {
  name = "EC2-S3-Instance-Profile"
}

# Create only if it does not exist
resource "aws_iam_instance_profile" "s3_instance_profile" {
  count = length(data.aws_iam_instance_profile.existing_s3_profile.id) > 0 ? 0 : 1
  name  = "EC2-S3-Instance-Profile"
  role  = aws_iam_role.s3_role.name
}
