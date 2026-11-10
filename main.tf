# =============================================================================
# MÓDULO: Root - Orquestación de recursos de infraestructura
# RESPONSABILIDAD: Coordinar los módulos de red y compute para aprovisionar
#                 la infraestructura del servicio de notificaciones.
# =============================================================================

# -----------------------------------------------------------------------------
# Módulo de red: VPC, subnets, internet gateway y security groups
# -----------------------------------------------------------------------------
module "network" {
  source = "./modules/network"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  environment         = var.environment
  availability_zones  = ["${var.region}a", "${var.region}b"]
}

# -----------------------------------------------------------------------------
# Módulo de compute: Instancias EC2, Launch Template y Auto Scaling Group
# -----------------------------------------------------------------------------
module "compute" {
  source = "./modules/compute"

  instance_type           = var.instance_type
  ami_id                  = var.ami_id
  min_size                = var.min_size
  max_size                = var.max_size
  desired_capacity        = var.desired_capacity
  vpc_security_group_ids  = [module.network.security_group_id]
  subnet_ids              = module.network.private_subnet_ids
  environment             = var.environment
}