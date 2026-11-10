#!/bin/bash

# ==============================================================================
# Script de verificación de estado de recursos desplegados
# Este script valida que la infraestructura de Terraform fue desplegada correctamente
# ==============================================================================

set -euo pipefail

# Colores para salida
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Variables de entorno
ENVIRONMENT="${ENVIRONMENT:-dev}"
REGION="${REGION:-us-east-1}"
MAX_RETRIES=3
RETRY_DELAY=10

# Función para logging
log_info() {
    echo -e "${GREEN}[INFO]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# Función para verificar si Terraform está instalado
check_terraform_installed() {
    log_info "Verificando instalación de Terraform..."
    if ! command -v terraform &> /dev/null; then
        log_error "Terraform no está instalado"
        exit 1
    fi
    TERRAFORM_VERSION=$(terraform version -json 2>/dev/null | grep -o '"version":"[^"]*' | cut -d'"' -f4)
    log_info "Terraform versión: ${TERRAFORM_VERSION}"
}

# Función para verificar que el estado de Terraform existe
check_terraform_state() {
    log_info "Verificando estado de Terraform para entorno: ${ENVIRONMENT}"
    
    local tfstate_path="environments/${ENVIRONMENT}/terraform.tfstate"
    
    if [ ! -f "$tfstate_path" ]; then
        log_warn "Estado local no encontrado en: ${tfstate_path}"
        log_info "Intentando verificar estado remoto..."
        return 1
    fi
    
    if ! terraform state pull > /dev/null 2>&1; then
        log_warn "No se pudo acceder al estado de Terraform"
        return 1
    fi
    
    log_info "Estado de Terraform accesible"
    return 0
}

# Función para verificar recursos de AWS
check_aws_resources() {
    log_info "Verificando recursos de AWS en región: ${REGION}"
    
    if ! command -v aws &> /dev/null; then
        log_warn "AWS CLI no está instalado, omitiendo verificación de recursos"
        return 0
    fi
    
    # Verificar credenciales
    if ! aws sts get-caller-identity > /dev/null 2>&1; then
        log_error "Credenciales de AWS no configuradas"
        return 1
    fi
    
    local account_id=$(aws sts get-caller-identity --query 'Account' --output text)
    log_info "Cuenta AWS: ${account_id}"
    
    # Verificar VPCs existentes
    local vpc_count=$(aws ec2 describe-vpcs --filters "Name=tag:Environment,Values=${ENVIRONMENT}" --query 'Vpcs | length' --output text 2>/dev/null || echo "0")
    log_info "VPCs encontradas para ${ENVIRONMENT}: ${vpc_count}"
    
    if [ "$vpc_count" -eq "0" ]; then
        log_warn "No se encontraron VPCs para el entorno ${ENVIRONMENT}"
        return 1
    fi
    
    # Verificar subnets
    local subnet_count=$(aws ec2 describe-subnets --filters "Name=tag:Environment,Values=${ENVIRONMENT}" --query 'Subnets | length' --output text 2>/dev/null || echo "0")
    log_info "Subnets encontradas: ${subnet_count}"
    
    if [ "$subnet_count" -eq "0" ]; then
        log_warn "No se encontraron subnets para el entorno ${ENVIRONMENT}"
        return 1
    fi
    
    # Verificar instancias EC2 o Auto Scaling Groups
    local asg_count=$(aws autoscaling describe-auto-scaling-groups --filters "Name=tag:Environment,Values=${ENVIRONMENT}" --query 'AutoScalingGroups | length' --output text 2>/dev/null || echo "0")
    log_info "Auto Scaling Groups encontrados: ${asg_count}"
    
    if [ "$asg_count" -eq "0" ]; then
        log_warn "No se encontraron Auto Scaling Groups para el entorno ${ENVIRONMENT}"
    fi
    
    return 0
}

# Función para verificar conectividad a endpoints
check_connectivity() {
    log_info "Verificando conectividad de red..."
    
    # Verificar acceso a internet desde las subnets
    local vpc_id=$(aws ec2 describe-vpcs --filters "Name=tag:Environment,Values=${ENVIRONMENT}" --query 'Vpcs[0].VpcId' --output text 2>/dev/null || echo "")
    
    if [ -z "$vpc_id" ]; then
        log_warn "No se pudo obtener ID de VPC para verificar conectividad"
        return 0
    fi
    
    # Verificar que las subnets tienen rutas a internet
    local route_table_count=$(aws ec2 describe-route-tables --filters "Name=vpc-id,Values=${vpc_id}" --query 'RouteTables | length' --output text 2>/dev/null || echo "0")
    log_info "Route tables encontradas: ${route_table_count}"
    
    return 0
}

# Función para verificar security groups
check_security_groups() {
    log_info "Verificando Security Groups..."
    
    local vpc_id=$(aws ec2 describe-vpcs --filters "Name=tag:Environment,Values=${ENVIRONMENT}" --query 'Vpcs[0].VpcId' --output text 2>/dev/null || echo "")
    
    if [ -z "$vpc_id" ]; then
        log_warn "No se pudo obtener ID de VPC para verificar Security Groups"
        return 0
    fi
    
    local sg_count=$(aws ec2 describe-security-groups --filters "Name=vpc-id,Values=${vpc_id}" --query 'SecurityGroups | length' --output text 2>/dev/null || echo "0")
    log_info "Security Groups encontrados: ${sg_count}"
    
    if [ "$sg_count" -eq "0" ]; then
        log_warn "No se encontraron Security Groups para el entorno ${ENVIRONMENT}"
        return 1
    fi
    
    return 0
}

# Función principal
main() {
    log_info "=========================================="
    log_info "Iniciando healthcheck de infraestructura"
    log_info "Entorno: ${ENVIRONMENT}"
    log_info "Región: ${REGION}"
    log_info "=========================================="
    
    local exit_code=0
    
    # Verificaciones
    check_terraform_installed || exit_code=1
    check_terraform_state || exit_code=1
    check_aws_resources || exit_code=1
    check_security_groups || exit_code=1
    check_connectivity || exit_code=1
    
    if [ $exit_code -eq 0 ]; then
        log_info "=========================================="
        log_info "Healthcheck completado exitosamente"
        log_info "=========================================="
    else
        log_error "=========================================="
        log_error "Healthcheck completado con errores"
        log_error "=========================================="
    fi
    
    return $exit_code
}

# Ejecutar función principal
main "$@"