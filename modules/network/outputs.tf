# Output: ID de la VPC
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

# Output: IDs de las subnets públicas
output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = aws_subnet.public[*].id
}

# Output: IDs de las subnets privadas
output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = aws_subnet.private[*].id
}

# Output: ID del Internet Gateway
output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.main.id
}

# Output: ID del Security Group
output "security_group_id" {
  description = "ID del Security Group del servicio de notificaciones"
  value       = aws_security_group.notifications.id
}