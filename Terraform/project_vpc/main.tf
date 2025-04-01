terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
  shared_config_files = ["C:/users/admin/.aws/config"]
  shared_credentials_files = ["C:/users/admin/.aws/credentials"]
  region = "us-east-1"
  profile = "default"
}

#creating aws vpc with local name main and tag Main VPC"
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "Main_VPC"
    }
}
