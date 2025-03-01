# Upload file to the S3 bucket
resource "aws_s3_object" "html_zip" {
  bucket = aws_s3_bucket.s3buck.bucket
  key    = "html.zip"   # The name of the file in S3
  source = "/root/html.zip"   # Path to your local file
  acl    = "public-read"  # Set ACL if needed (e.g., public-read)
}
