####################################################################################
#This file is used for value definition for specific environment e.g dev, prod, qual.
####################################################################################

// AWS region 
aws_region = "us-west-2"

// Bool for creating SG rules
create_sg_rules = true

// vpc_id for ECS stack
vpc_id = "vpc-49be512f"

// subnet_ids for ECS stack
subnet_ids = ["subnet-f8f129a3", "subnet-86229fad"]
// IP CIDR from which 80 & 443 will be allowed in loadbalancer SG
web_lb_cidr = ["0.0.0.0/0"]

// Tags for all the resources
tags = {
  Managed-by = "Terraform"
  Env        = "dev"
}

// Name of the ECS Cluster
ecs_cluster_name = "jd-soap-cluster"


// A unique name for your task definition.
task_definition_name = "jd-soap-app4"

// Docker networking mode to use for the containers in the task.
network_mode = "awsvpc"

// Number of cpu units used by the task.
task_definition_cpu = 1024

// Amount (in MiB) of memory used by the task
task_definition_memory = 2048

// Set of launch types required by the task. The valid values are EC2 and FARGATE
requires_compatibilities = ["FARGATE"]

// Configuration block for volumes that containers in your task may use.
volume_name = "jd-soap-vol"

// ECR URL
ecr_repository_uri = "847370586410.dkr.ecr.us-west-2.amazonaws.com/appmod"

ecr_image_version = "initial"

// Name of the container
container_name = "jd-soap-app4"


// The number of CPU units set for the container.
// These are CPU and Memory combinations
# cpu: 256 (.25 vCPU)  memory: 512 (0.5GB), 1024 (1GB), 2048 (2GB)
# cpu: 512 (.5 vCPU)  memory: 1024 (1GB), 2048 (2GB), 3072 (3GB), 4096 (4GB)
# cpu: 1024 (1 vCPU)  memory: 2048 (2GB), 3072 (3GB), 4096 (4GB), 5120 (5GB), 6144 (6GB), 7168 (7GB), 8192 (8GB)
# cpu: 2048 (2 vCPU)  memory: Between 4096 (4GB) and 16384 (16GB) in increments of 1024 (1GB)
# cpu: 4096 (4 vCPU)  memory: Between 8192 (8GB) and 30720 (30GB) in increments of 1024 (1GB)
container_cpu = 512

// The hard limit (in MiB) of memory set for the container.
container_memory = 512

// If the essential parameter of a container is marked as true, and that container fails or stops for any reason, all other containers that are part of the task are stopped.
task_definition_essentail = true

// container_port
container_port = 8080

// hostPort
hostPort = 8080

// Name of the service
ecs_service_name = "jd-soap-app4-service"

// Number of instances of the task definition.
desired_count = 1

// Launch type on which to run your service. The valid values are EC2, FARGATE, and EXTERNAL.
launch_type = "FARGATE"

// Scheduling strategy to use for the service. The valid values are REPLICA and DAEMON.
scheduling_strategy = "REPLICA"

// Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown
health_check_grace_period = 60

// Assign a public IP address to the ENI (Fargate launch type only).
assign_public_ip = true

// Upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment.
deployment_maximum_percent = 200

// Lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment.
deployment_minimum_healthy_percent = 100

// Name of the web service SG
web_service_sg_name = "jd-soap-service-sg"

// Description of web service SG
web_service_sg_description = "SG created for ECS service"

// Web Service SG rule description
web_service_sg_rule_description = "Allow load Balancer traffic"

// loadbalancer name
load_balancer_name = "jd-soap-lb"

// Name of the target group
blue_target_group_name = "jd-soap-app4-blue-target"

// Name of the target group
green_target_group_name = "jd-soap-app4-green-target"

// Port on which targets receive traffic.
blue_target_group_port = 8080

// Port on which targets receive traffic.
green_target_group_port = 9090

// Protocol to use for routing traffic to the targets.
target_group_protocol = "HTTP"

// Type of target that you must specify when registering targets with this target group.
target_group_target_type = "ip"

// Destination for the health check request.
target_group_health_check_path = "/spring-hello-world-1.0/first/"

// Response codes to use when checking for a healthy responses from a target.
target_group_matcher = "200"

// Boolean to enable / disable stickiness.
health_check_enabled = true

// Protocol to use to connect with the target. Defaults to HTTP.
health_check_protocol = "HTTP"

// Amount of time, in seconds, during which no response means a failed health check.
health_check_timeout = 20

// health_check_interval
health_check_interval = 60

// Number of consecutive health checks 
health_check_healthy_threshold = 3

// Number of consecutive health check failures required before considering the target unhealthy.
health_check_unhealthy_threshold = 5

// Name of the web loadbalancer SG
web_lb_sg_name = "jd-soap-lb-sg"

// Description of web lb sg
web_lb_sg_description = "SG created for loadbalancer"

// LB ingress ports
web_lb_ingress_ports = ["80", "8080"]

// Protocol for SG Rules
web_lb_rules_protocol = "tcp"

// Ingress port number for ECS service SG
web_service_sg_port = 80

// Green listener port
green_listener_port = 9090

// Green listener port
blue_listener_port = 80


// Code deploy config Name
deployment_config_name = "app4-EcsCanary25Percent2Minutes"

// compute_platform
compute_platform = "ECS"

// deployment traffic_routing type
traffic_routing_type = "AllAtOnce"

// time interval for routing traffic
time_based_canary_interval = 1

// time_based_canary_percentage
time_based_canary_percentage = 25

// aws codedeploy app name
aws_codedeploy_app_name = "app4"

// deployment_group_name
deployment_group_name = "app4-deployment-group"