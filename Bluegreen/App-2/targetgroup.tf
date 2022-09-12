# // Target Group and Listener Rules Resources File

resource "aws_lb_target_group" "jd-soap-app2-blue" {
  name        = var.blue_target_group_name
  port        = var.blue_target_group_port
  protocol    = var.target_group_protocol
  target_type = var.target_group_target_type
  vpc_id      = var.vpc_id


  health_check {
    path                = var.target_group_health_check_path
    matcher             = var.target_group_matcher
    enabled             = var.health_check_enabled
    interval            = var.health_check_interval
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

}

data "aws_lb" "jd-soap-lb" {

  name = var.load_balancer_name
}

data "aws_lb_listener" "blue-listener" {
  load_balancer_arn  = data.aws_lb.jd-soap-lb.arn
  port = 80
}

data "aws_lb_listener" "green-listener" {
  load_balancer_arn  = data.aws_lb.jd-soap-lb.arn
  port = 9090
}



resource "aws_lb_listener_rule" "listener-rule-app2" {
  listener_arn = data.aws_lb_listener.blue-listener.arn
  # priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jd-soap-app2-blue.arn
  }

  condition {
    path_pattern {
      values = ["/app2/*"]
    }
  }
}


# resource "aws_lb_listener" "jd-soap-blue-listener" {
#   load_balancer_arn = data.aws_lb.jd-soap-lb.arn
#   port              = var.blue_listener_port
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.jd-soap-app2-blue.arn 
#   }

# }




resource "aws_lb_target_group" "jd-soap-app2-green" {
  name        = var.green_target_group_name
  port        = var.green_target_group_port
  protocol    = var.target_group_protocol
  target_type = var.target_group_target_type
  vpc_id      = var.vpc_id


  health_check {
    path                = var.target_group_health_check_path
    matcher             = var.target_group_matcher
    enabled             = var.health_check_enabled
    interval            = var.health_check_interval
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

}



# resource "aws_lb_listener" "jd-soap-green-listener" {
#   load_balancer_arn = data.aws_lb.jd-soap-lb.arn
#   port              = var.green_listener_port
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.jd-soap-app2-green.arn
#   }
  
# }



# data "aws_lb" "jd-soap-lb" {

#   name = var.load_balancer_name
# }

# data "aws_lb_listener" "listener" {
#   load_balancer_arn  = data.aws_lb.jd-soap-lb.arn
#   port = 80
# }



# resource "aws_lb_listener_rule" "listener-rule-app2" {
#   listener_arn = data.aws_lb_listener.listener.arn
#   priority     = 100

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.jd-soap-app2-blue.arn
#   }

  # condition {
  #   path_pattern {
  #     values = ["/app2/*"]
  #   }
  # }
# }


# resource "aws_lb_listener" "jd-soap-app2" {
#   load_balancer_arn = aws_lb.rolling.arn
#   port              = var.blue_listener_port
#   protocol          = "HTTP"


#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.jd-soap-app2.arn
#   }
# }

# # resource "aws_lb_listener" "web_443" {
# #   load_balancer_arn = aws_lb.web.arn
# #   port              = "443"
# #   protocol          = "HTTPS"
# #   # ssl_policy        = "ELBSecurityPolicy-2016-08"
# #   # certificate_arn   = data.aws_acm_certificate.main.arn

# #   default_action {
# #     type             = "forward"
# #     target_group_arn = aws_lb_target_group.web.arn
# #   }
# # }



