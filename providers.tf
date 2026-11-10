# Configuración del proveedor AWS y versión de Terraform requerida.
# Este archivo define los proveedores necesarios para desplegar la infraestructura.

terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Configuración del backend remoto para almacenar el estado de Terraform
  backend "s3" {
    bucket         = "terraform-state-bucket-notifications-service"
    key            = "terraform/state/notifications-service.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

# Configuración del proveedor AWS
provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = var.environment
      Service     = "notifications-service"
      Terraform   = "true"
    }
  }
}