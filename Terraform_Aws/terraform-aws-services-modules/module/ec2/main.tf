resource "aws_security_group" "sg"{
name = "${var.name}-sg"
vpc_id = var.vpc_id

ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}
tags = merge(var.tags, {
    Name = "${var.name}-sg"
  })

}


resource "aws_instance" "this"{
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.this.id]
    associate_public_ip = var.associate_public_ip

    tags = {
        Name = var.name
    }
}