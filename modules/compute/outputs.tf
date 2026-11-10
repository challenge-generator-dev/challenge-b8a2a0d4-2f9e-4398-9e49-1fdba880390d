output "instance_ids" {
  description = "IDs de las instancias EC2 creadas"
  value       = aws_instance.notifications[*].id
}

output "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = aws_autoscaling_group.notifications.name
}

output "asg_arn" {
  description = "ARN del Auto Scaling Group"
  value       = aws_autoscaling_group.notifications.arn
}

output "launch_template_id" {
  description = "ID del Launch Template"
  value       = aws_launch_template.notifications.id
}

output "launch_template_name" {
  description = "Nombre del Launch Template"
  value       = aws_launch_template.notifications.name
}

output "security_group_id" {
  description = "ID del Security Group creado para las instancias"
  value       = aws_security_group.notifications_elb.id
}

// TODO(reto): Implementar output para iam_instance_profile una vez creado el recurso en main.tf
// output "iam_instance_profile" {
//   description = "Nombre del perfil de instancia IAM"
//   value       = aws_iam_instance_profile.notifications.name
// }