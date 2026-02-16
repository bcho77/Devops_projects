resource "aws_launch_template" "lt"{
    name_prefix = "${var.name}-lt-"
    image_id =  var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_ids

    tag_specifications {
      resource_type = "instance"
      tags = merge(
        var.tags,
        {
            Name = var.name
        }
      )
    }
}

resource "aws_autoscaling_group" "asg" {
    name = var.name
    vpc_zone_identifier = var.subnet_ids
    target_group_arns = var.target_group_arns

    desired_capacity = var.desired_capacity
    min_size = var.min_size
    max_size = var.max_size

    health_check_type = "ELB"
    health_check_grace_period = 300

    launch_template {
      id = aws_launch_template.lt.id
      version = "$Latest"
    }

    tag{
        key = "Name"
        value = var.name
        propagate_at_launch = true
    }

    lifecycle {
      create_before_destroy = true
    }
  
}