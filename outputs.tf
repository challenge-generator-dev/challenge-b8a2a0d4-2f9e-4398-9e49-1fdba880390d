# =============================================================================
# MÓDULO: Root - Outputs de la infraestructura
# RESPONSABILIDAD: Exponer la información relevante de los recursos
#                 desplegados para consumo externo.
# =============================================================================

# -----------------------------------------------------------------------------
# Outputs del módulo de red
# -----------------------------------------------------------------------------
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = module.network.private_subnet_ids
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = module.network.internet_gateway_id
}

output "security_group_id" {
  description = "ID del security group para el servicio de notificaciones"
  value       = module.network.security_group_id
}

# -----------------------------------------------------------------------------
# Outputs del módulo de compute
# -----------------------------------------------------------------------------
output "instance_ids" {
  description = "IDs de las instancias EC2 del servicio de notificaciones"
  value       = module.compute.instance_ids
}

output "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.asg_name
}

output "asg_arn" {
  description = "ARN del Auto Scaling Group"
  value       = module.compute.asg_arn
}

output "launch_template_id" {
  description = "ID del Launch Template"
  value       = module.compute.launch_template_id
}

output "launch_template_name" {
  description = "Nombre del Launch Template"
  value       = module.compute.launch_template_name
}

// TODO(reto): Descomentar una vez que el recurso aws_iam_instance_profile esté creado en modules/compute/main.tf
// output "iam_instance_profile" {
//   description = "Nombre del perfil de instancia IAM"
//   value       = module.compute.iam_instance_profile
// }