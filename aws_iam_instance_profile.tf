# Fetch existing IAM instance profile
data "aws_iam_instance_profile" "existing_s3_profile" {
  name = "EC2-S3-Instance-Profile"
}

# Create IAM instance profile only if it does not exist
resource "aws_iam_instance_profile" "s3_instance_profile" {
  name  = "EC2-S3-Instance-Profile"
  role  = aws_iam_role.s3_role.name

  lifecycle {
    prevent_destroy = true
  }
}
