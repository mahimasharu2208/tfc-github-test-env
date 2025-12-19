# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # This configuration tells Terraform to use the Terraform Cloud backend
  cloud { 
    organization = "mahima-test"
    workspaces { 
      name = "github-tfc-plan-test" 
    } 
  }
}

# Provider configuration block
provider "aws" {
  region = "us-east-1" # Change to your desired region
}

# A simple resource: AWS S3 Bucket
resource "aws_s3_bucket" "example" {
  bucket = "tfc-github-test-bucket-unique-1336234" # MUST be globally unique
  
  tags = {
    Name        = "Managed by TFC via GitHub Actions"
    Environment = "Test"
  }
}
