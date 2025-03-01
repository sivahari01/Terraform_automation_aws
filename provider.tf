terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"  # Specify the AWS region
  access_key = ${{ secrets.AWS_ACCESS }}      # Your AWS Access Key ID
  secret_key = ${{ secrets.SECRET_KEY }}  # Your AWS Secret Access Ke
}
