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
  access_key = "your-access-key-id"       # Your AWS Access Key ID
  secret_key = "your-secret-access-key"   # Your AWS Secret Access Ke
}
