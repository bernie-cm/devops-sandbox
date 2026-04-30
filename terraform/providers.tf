terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "devops-sandbox-tfstate-bernie-aws"
    key            = "terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = var.aws_region
}
