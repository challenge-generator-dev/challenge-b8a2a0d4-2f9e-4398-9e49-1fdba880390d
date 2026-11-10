# Configuración del ambiente de desarrollo para el servicio de notificaciones
# Valores optimizados para pruebas y desarrollo con costos controlados

region = "us-east-1"
environment = "dev"

# Red - CIDR pequeño para desarrollo
vpc_cidr = "10.0.0.0/24"
public_subnet_cidrs  = ["10.0.0.0/27", "10.0.0.32/27"]
private_subnet_cidrs = ["10.0.0.64/27", "10.0.0.96/27"]

# Compute - Instancias pequeñas para desarrollo
instance_type = "t3.micro"
ami_id = "ami-0c55b159cbfafe1f0"

# Auto Scaling Group - Configuración mínima para desarrollo
min_size = 1
max_size = 2
desired_capacity = 1

# Configuración adicional de red para el módulo de compute
# Los valores de subnet_ids y vpc_security_group_ids se asignan automáticamente
# desde los outputs del módulo de red en el main.tf del root