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

// Name of the web service SG
web_service_sg_name = "jd-soap-service-sg"

// Description of web service SG
web_service_sg_description = "SG created for ECS service"

// Web Service SG rule description
web_service_sg_rule_description = "Allow load Balancer traffic"

// loadbalancer name
load_balancer_name = "jd-soap-lb"

// Loadbalancer mode if true, the LB will be internal.
internal = false

// The type of load balancer to create. Possible values are application, gateway, or network.
load_balancer_type = "application"

// If true, deletion of the load balancer will be disabled via the AWS API.
enable_deletion_protection = false

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
listener_port = 80



// Name of the ECS Cluster
ecs_cluster_name = "jd-soap-cluster"

// Set of names of one or more capacity providers to associate with the cluster.
capacity_providers = ["FARGATE"]

// Name of the default capacity provider
default_capacity_provider = "FARGATE"

// The number we tasks, at a minimum, to run on the specified capacity provider.
capacity_provider_base = 1

//The relative percentage of the total number of launched tasks that should use the specified capacity provider.
capacity_provider_weight = 100

// Enable or disable container insights
container_insights = "enabled"
