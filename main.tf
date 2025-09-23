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
  region = "us-east-1"
}

# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-08982f1c5bf93d976" # Example: Amazon Linux 2 AMI (update to region-specific AMI)
  instance_type = "t2.micro"
  #key_name      = aws_key_pair.my_key.key_name
  #security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "MyEC2Instance-githubactions"
  }
}
