resource "aws_s3_bucket_acl" "s3buck_acl" {
  bucket = aws_s3_bucket.s3buck.id
  acl    = "public-read"
}
