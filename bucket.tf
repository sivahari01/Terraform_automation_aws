resource "aws_s3_bucket" "s3buck" {
  bucket = "myvtfitestsbucket1232"
  
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

  public_access_block_configuration {
    block_public_acls   = false
    block_public_policy = false
  }
}
