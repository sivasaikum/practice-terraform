terraform {
  required_providers {
     aws = {
        source = "hashicorp/aws"
        version = "5.88.0"
     }
  }
  backend "s3" {
    bucket = "sai-terraform-practice"
    key = "practice-expense-project"
    region = "us-east-1"
    dynamodb_table = "sai-terraform-practice"
  }
  
  
}

provider "aws" {
    region = "us-east-1"
}