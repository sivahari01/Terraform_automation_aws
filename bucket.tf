resource "random_pet" "s3_name" {
  length = 2  # Generates two random words
}

resource "aws_s3_bucket" "s3buck" {
  bucket = "myrbucket-${random_pet.s3_name.id}"
  
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
