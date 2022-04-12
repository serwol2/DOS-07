terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  #access_key = "AKIAT7EVD2KBERXXXXX"
  #secret_key = "rnucH1/Th8CHKIgPa4W+PCYEEZXXXXXXXXXX"

}

resource "aws_security_group" "my-sg-hw43" {
  name        = "my-sg-hw43"
  description = "Traffic 80 and 22"

  ingress {
    description      = "22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_key_pair" "key" {
  key_name   = "mykey"
  public_key = file("~/.ssh/mykey.pub")
}

resource "aws_instance" "hw43-ci-cd" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name = aws_key_pair.key.key_name
  security_groups = [aws_security_group.my-sg-hw43.name]
  tags = {
    Name = "hw43-ci-cg"
  }

}

output "ec2instance" {
  value = aws_instance.hw43-ci-cd.public_ip
}