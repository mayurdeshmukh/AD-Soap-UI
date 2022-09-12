// Load balancer Resource File

resource "aws_lb" "jd-soap-ui-lb" {
  name                       = var.load_balancer_name
  internal                   = var.internal
  load_balancer_type         = var.load_balancer_type
  security_groups            = [aws_security_group.web_lb.id]
  subnets                    = var.subnet_ids
  enable_deletion_protection = var.enable_deletion_protection
  tags                       = var.tags
}

# resource "aws_lb_target_group" "jd-soap-app1" {
#   name        = var.blue_target_group_name
#   port        = var.blue_target_group_port
#   protocol    = var.target_group_protocol
#   target_type = var.target_group_target_type
#   vpc_id      = var.vpc_id

#   # depends_on = [aws_lb.web]

#   health_check {
#     path                = var.target_group_health_check_path
#     matcher             = var.target_group_matcher
#     enabled             = var.health_check_enabled
#     interval            = var.health_check_interval
#     protocol            = var.health_check_protocol
#     timeout             = var.health_check_timeout
#     healthy_threshold   = var.health_check_healthy_threshold
#     unhealthy_threshold = var.health_check_unhealthy_threshold
#   }

# }


resource "aws_lb_listener" "jd-soap-ui-blue-listener" {
  load_balancer_arn = aws_lb.jd-soap-ui-lb.arn
  port              = var.listener_port
  protocol          = "HTTP"


  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener" "jd-soap-ui-green-listener" {
  load_balancer_arn = aws_lb.jd-soap-ui-lb.arn
  port              = 9090
  protocol          = "HTTP"


  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}




# resource "aws_lb_listener" "web_443" {
#   load_balancer_arn = aws_lb.web.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   # ssl_policy        = "ELBSecurityPolicy-2016-08"
#   # certificate_arn   = data.aws_acm_certificate.main.arn

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.web.arn
#   }
# }
