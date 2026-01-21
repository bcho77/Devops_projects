# In this project we deploy a simple Nginx web server using Terraform and AWS. The configuration includes the necessary resources to create an EC2 instance, security group, and user data to install and start Nginx.

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.92"
    }
  }
  required_version = ">=1.2"
}

provider "aws" {
    region = var.aws_region
  
}
resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  
}
}

resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.web_server_sg.name]
#   user_data     = file("user_data.sh")
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install nginx1 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Welcome to Terraform Web Server</h1>" | sudo tee /usr/share/nginx/html/index.html
              EOF
  tags = {
    Name = "Terraform-Web-Server"
  }
}