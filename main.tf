terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.56.1"
    }
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "gcrozariol"
}

resource "aws_s3_bucket" "terraform-state" {
  bucket        = "docker-iac"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    IAC = "True"
  }
}

resource "aws_s3_bucket_versioning" "terraform-state" {
  bucket = "docker-iac"

  versioning_configuration {
    status = "Enabled"
  }
}