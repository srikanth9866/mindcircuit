provider "aws" {
  region = "us-east-1" # Change to your preferred region
}



# Security group to allow SSH
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ⚠️ Not secure, restrict in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-08982f1c5bf93d976" # Example: Amazon Linux 2 AMI (update to region-specific AMI)
  instance_type = "t2.micro"
  #key_name      = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "MyEC2Instance-githubactions"
  }
}
