################# ALB security group #########

resource "aws_security_group" "sg_alb"{
    name = "alb_sg"
    vpc_id = var.vpc_id
    description = "Security group for ALB"
    tags = var.tags

}

resource "aws_security_group_rule" "alb_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_alb.id
}

resource "aws_security_group_rule" "alb_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_alb.id
}

resource "aws_security_group_rule" "alb_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_alb.id
}

############## ALB resource #################

resource "aws_alb" "alb" {
    name = var.name
    load_balancer_type = "application"
    internal = var.internal
    subnets = var.subnet_ids
    security_groups = [aws_security_group.sg_alb.id]

    tags = var.tags
}

################# Target group ################

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

############## Listener #############

resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_alb.alb.arn
    port = 80
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.albtg.arn
    }
  
}