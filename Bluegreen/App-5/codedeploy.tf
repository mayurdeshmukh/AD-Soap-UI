
# resource "aws_codedeploy_deployment_config" "custom_canary" {
#   deployment_config_name = var.deployment_config_name
#   compute_platform       = var.compute_platform
#     lifecycle {
#     create_before_destroy = true
#   }

#   traffic_routing_config {
#     type = var.traffic_routing_type
#     # time_based_canary {
#     #   interval   = var.time_based_canary_interval
#     #   percentage = var.time_based_canary_percentage
#     # }
#   }
# }



# resource "aws_codedeploy_app" "app5" {
#   compute_platform = var.compute_platform
#   name             = var.aws_codedeploy_app_name
# }

# resource "aws_codedeploy_deployment_group" "this" {
#   app_name               = aws_codedeploy_app.app5.name
#   deployment_config_name = var.deployment_config_name
#   deployment_group_name  = var.deployment_group_name
#   service_role_arn       = "arn:aws:iam::847370586410:role/codedeploy_role"

#   blue_green_deployment_config {
#     deployment_ready_option {
#       action_on_timeout = "CONTINUE_DEPLOYMENT"
#     }

#     terminate_blue_instances_on_deployment_success {
#       action                           = "TERMINATE"
#       termination_wait_time_in_minutes = 5
#     }
#   }

#   deployment_style {
#     deployment_option = "WITH_TRAFFIC_CONTROL"
#     deployment_type   = "BLUE_GREEN"
#   }

#   ecs_service {
#     cluster_name = var.ecs_cluster_name
#     service_name = aws_ecs_service.jd-soap-app5.name
#   }

#   auto_rollback_configuration {
#     enabled = true
#     events  = ["DEPLOYMENT_FAILURE"]
#   }


#   load_balancer_info {
#     target_group_pair_info {
#       prod_traffic_route {
#         listener_arns = [data.aws_lb_listener.blue-listener.arn]
#       }

#       test_traffic_route {
#         listener_arns = [data.aws_lb_listener.green-listener.arn]

#       }

#       target_group {
#         name = aws_lb_target_group.jd-soap-app5-blue.name
#       }

#       target_group {
#         name = aws_lb_target_group.jd-soap-app5-green.name
#       }
#     }
#   }
# }