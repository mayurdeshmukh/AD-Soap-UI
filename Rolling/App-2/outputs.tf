
// aws_ecs_task_definition Outputs
output "task_definition_revision" {
  description = "Revision of the task in a particular family."
  value       = aws_ecs_task_definition.web.revision
}


output "task_definition_arn" {
  description = "Full ARN of the Task Definition."
  value       = aws_ecs_task_definition.web.arn
}



// aws_ecs_service Ouputs
output "service_name" {
  description = "Name of the service."
  value       = aws_ecs_service.jd-soap-app2.name
}

output "service_id" {
  description = "ARN that identifies the service."
  value       = aws_ecs_service.jd-soap-app2.id
}

output "ecs_desired_count" {
  description = "Number of instances of the task definition."
  value       = aws_ecs_service.jd-soap-app2.desired_count
}
