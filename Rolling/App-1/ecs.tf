data "aws_ecs_cluster" "ecs_cluster" {
  cluster_name = var.ecs_cluster_name
}

data "aws_security_group" "selected" {
  name = "jd-soap-service-sg"
}


data "template_file" "task_definition_json" {
  template = file("resources/task-definition.json")
  vars = {
    name = var.container_name
    ecr_repository_uri = var.ecr_repository_uri
    ecr_image_version = var.ecr_image_version
  }
}

resource "aws_ecs_task_definition" "web" {
  family                   = var.task_definition_name
  container_definitions    = data.template_file.task_definition_json.rendered
  network_mode             = var.network_mode
  execution_role_arn       = "arn:aws:iam::847370586410:role/ecs_role"
  cpu                      = var.task_definition_cpu
  memory                   = var.task_definition_memory
  requires_compatibilities = var.requires_compatibilities

  volume {
    name = var.volume_name
  }

}


resource "aws_ecs_service" "jd-soap-app1" {
  name                              = var.ecs_service_name
  cluster                           = data.aws_ecs_cluster.ecs_cluster.arn
  task_definition                   = aws_ecs_task_definition.web.arn
  desired_count                     = var.desired_count
  launch_type                       = var.launch_type
  scheduling_strategy               = var.scheduling_strategy
  health_check_grace_period_seconds = var.health_check_grace_period

  network_configuration {
    subnets = var.subnet_ids
    #subnets          = module.vpc.public_subnets
    security_groups  = [data.aws_security_group.selected.id]
    assign_public_ip = var.assign_public_ip
  }

  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent

  load_balancer {
    target_group_arn = aws_lb_target_group.jd-soap-app1.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
  depends_on = [
    aws_ecs_task_definition.web,
  ]

}

