terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_instance" "example-0000" {
  ami = "ami-002068ed284fb165b"
  shape ="t2.micro"
  tags = {
    Name = "Example-0000"
    Terraform = "True"
  }
}