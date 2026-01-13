
resource "aws_security_group" "web_sgroup" {
    name        = "web-sg"
    description = "Allow HTTP and SSH traffic"
    vpc_id      = aws_vpc.main.id
    
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        security_groups = [aws_security_group.alb_sgroup.id]

    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "web_server" {
    count        = 2
    ami           = var.ami_id
    instance_type = var.instance_type
    subnet_id     = element(aws_subnet.private.*.id, 0)
    vpc_security_group_ids = [aws_security_group.web_sgroup.id]
    user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo amazon-linux-extras install nginx1 -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
                echo "<h1>Server ${count.index}</h1>" > /usr/share/nginx/html/index.html
                EOF
    tags = {
        Name = "web-${count.index}"

    }
  
}