
############## ALB resource #################

resource "aws_alb" "alb"{
    name = var.name
    load_balancer_type = "application"
    internal = var.internal
    subnets = var.subnet_ids
    security_groups = var.security_group_ids

    tags = var.tags
}


#################### Target group ########

resource "aws_lb_target_group" "albtg"{
    name = "${var.name}-tg"
    port = var.target_port
    protocol = var.target_protocol
    vpc_id = var.vpc_id

    health_check {
      path = var.health_check_path
      protocol = var.target_protocol
      matcher = "200-399"
      interval = 30
      timeout = 5
      healthy_threshold = 2
      unhealthy_threshold = 2
    }

    tags = var.tags
}

###### Listener########

resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_alb.alb
    port = 80
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.albtg.arn
      
    }
  
}