# Variables específicas del módulo de computo.
# Estas variables se utilizan para configurar las instancias EC2 y otros recursos de computo.

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
}

variable "min_size" {
  description = "Tamaño mínimo del Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Tamaño máximo del Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  type        = number
}

variable "vpc_security_group_ids" {
  description = "Lista de IDs de los security groups para las instancias"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Lista de IDs de las subredes donde se desplegarán las instancias"
  type        = list(string)
}

variable "environment" {
  description = "Ambiente de despliegue (dev, prod, etc.)"
  type        = string
}