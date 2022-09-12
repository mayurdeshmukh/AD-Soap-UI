// ECS Resource File

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name
  
  setting {
    name  = "containerInsights"
    value = var.container_insights
  }
}


resource "aws_ecs_cluster_capacity_providers" "ecs_cluster" {
  cluster_name       = aws_ecs_cluster.ecs_cluster.name
  capacity_providers = var.capacity_providers

  default_capacity_provider_strategy {
    base              = var.capacity_provider_base
    weight            = var.capacity_provider_weight
    capacity_provider = var.default_capacity_provider
  }
}

