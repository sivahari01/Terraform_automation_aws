resource "aws_s3_bucket" "s3buck" {
  bucket = "myvtfitestsbucket1232"
  
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "s3buck_block" {
  bucket = aws_s3_bucket.s3buck.id

  block_public_acls   = false
  block_public_policy = false
}
