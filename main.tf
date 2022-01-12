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

resource "aws_security_group" "sec-http" {
  name = "sg-instance"

  ingress {
    from_port = 0
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sec-ssh" {
  name = "sg-instance"

  ingress {
    from_port = 0
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example-0000" {
  ami = data.aws_ami.ubuntu.id
  instance_type ="t2.micro"
  vpc_security_group_ids = [aws_security_group.sec-http.id,aws_security_group.sec-ssh.id]
  tags = {
    Name = "Example-0020"
    Terraform = "True"
  }
}




