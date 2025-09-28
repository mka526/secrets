# main.tf
provider "aws" {
  region = "us-east-1"
}

# Use the default VPC so the demo runs anywhere
data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "ssh_anywhere" {
  name        = "demo-ssh-anywhere"
  description = "Allow SSH from anywhere (DEMO)"
  vpc_id      = data.aws_vpc.default.id

  # SSH over IPv4
  ingress {
    description      = "SSH IPv4"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # (Optional) SSH over IPv6
  ingress {
    description       = "SSH IPv6"
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    ipv6_cidr_blocks  = ["::/0"]
  }

  # Allow all outbound so you can update/packages, etc.
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "demo_ssh_anywhere"
  }
}
