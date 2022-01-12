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

resource "aws_security_group" "sec-8080" {
  name = "sg-instance"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example-0000" {
  ami = "ami-002068ed284fb165b"
  instance_type ="t2.micro"
  vpc_security_group_ids = [aws_security_group.sec-8080.id]
  tags = {
    Name = "Example-0000"
    Terraform = "True"
  }
}