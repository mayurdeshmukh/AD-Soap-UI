
// aws_ecs_task_definition Outputs
output "task_definition_revision" {
  description = "Revision of the task in a particular family."
  value       = aws_ecs_task_definition.jd-soap-app6.revision
}


output "task_definition_arn" {
  description = "Full ARN of the Task Definition."
  value       = aws_ecs_task_definition.jd-soap-app6.arn
}



// aws_ecs_service Ouputs
output "service_name" {
  description = "Name of the service."
  value       = aws_ecs_service.jd-soap-app6.name
}

output "service_id" {
  description = "ARN that identifies the service."
  value       = aws_ecs_service.jd-soap-app6.id
}

output "ecs_desired_count" {
  description = "Number of instances of the task definition."
  value       = aws_ecs_service.jd-soap-app6.desired_count
}
