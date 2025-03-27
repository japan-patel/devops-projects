terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  shared_config_files = ["C:/users/admin/.aws/config"]
  shared_credentials_files = ["C:/users/admin/.aws/credentials"]
  region = "us-east-1"
  profile = "default"
}

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "s3-bucket-terraform-useast1-123"
}
