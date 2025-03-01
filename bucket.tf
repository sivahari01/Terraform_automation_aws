resource "aws_s3_bucket" "s3buck" {
  bucket = "myvtfitestsbucket1232"
  acl    = "public" 
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
