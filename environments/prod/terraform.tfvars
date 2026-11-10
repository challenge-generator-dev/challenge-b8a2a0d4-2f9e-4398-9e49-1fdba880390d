# Configuración del ambiente de producción para el servicio de notificaciones
# Valores optimizados para alta disponibilidad y rendimiento en producción

region = "us-east-1"
environment = "prod"

# Red - CIDR más amplio para producción con múltiples AZs
vpc_cidr = "10.1.0.0/16"
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs = ["10.1.10.0/24", "10.1.11.0/24", "10.1.12.0/24"]

# Compute - Instancias de mayor tamaño para producción
instance_type = "t3.medium"
ami_id = "ami-0c55b159cbfafe1f0"

# Auto Scaling Group - Configuración de alta disponibilidad para producción
min_size = 3
max_size = 10
desired_capacity = 5