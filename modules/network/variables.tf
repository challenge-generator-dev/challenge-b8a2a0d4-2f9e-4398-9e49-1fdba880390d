# Variables específicas del módulo de red.
# Estas variables se utilizan para configurar la VPC, subredes y otros recursos de red.

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes privadas"
  type        = list(string)
}

variable "environment" {
  description = "Ambiente de despliegue (dev, prod, etc.)"
  type        = string
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad para distribuir las subredes"
  type        = list(string)
}