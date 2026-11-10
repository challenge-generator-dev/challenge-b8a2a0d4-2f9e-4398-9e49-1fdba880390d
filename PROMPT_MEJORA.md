# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261110090352996), Aprovisiona con Terraform la red y el computo del servicio de notificaciones

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Versionado de Infraestructura con Terraform para el Servicio de Notificaciones
- Tiempo estimado: 10 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Exploración y Configuración Inicial — objetivo: Configurar el entorno de Terraform y definir los recursos básicos para el servicio de notificaciones. — entregable (NO resolver): Configuración inicial de Terraform con recursos básicos definidos y versionados.
- Fase 2: Aprovisionamiento de la Infraestructura — objetivo: Aprovisionar la red y el computo del servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Infraestructura del servicio de notificaciones aprovisionada y documentada.
- Fase 3: Versionado de la Infraestructura — objetivo: Versionar la configuración de Terraform para el servicio de notificaciones. — entregable (NO resolver): Configuración de Terraform versionada en un repositorio.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: variables.tf ===
# Declaración de variables globales para parametrizar la configuración de la infraestructura.
# Estas variables serán utilizadas en los archivos main.tf y en los módulos.

variable "region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
}

variable "environment" {
  description = "Ambiente de despliegue (dev, prod, etc.)"
  type        = string
}

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

// === ARCHIVO: providers.tf ===
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

// === ARCHIVO: modules/network/variables.tf ===
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

// === ARCHIVO: modules/compute/variables.tf ===
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

// === ARCHIVO: modules/network/main.tf ===
# Recurso: VPC para el servicio de notificaciones
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.environment}-notifications-vpc"
    Environment = var.environment
  }
}

# Recurso: Subnets públicas
resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.environment}-public-subnet-${count.index + 1}"
    Environment = var.environment
    Type        = "public"
  }
}

# Recurso: Subnets privadas
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.environment}-private-subnet-${count.index + 1}"
    Environment = var.environment
    Type        = "private"
  }
}

# Recurso: Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.environment}-igw"
    Environment = var.environment
  }
}

# Recurso: Security Group para el servicio de notificaciones
resource "aws_security_group" "notifications" {
  name        = "${var.environment}-notifications-sg"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    description = "Salida completa"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-notifications-sg"
    Environment = var.environment
  }
}

// === ARCHIVO: modules/network/outputs.tf ===
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

// === ARCHIVO: modules/compute/main.tf ===
# Recurso: Instancia EC2 para el servicio de notificaciones
resource "aws_instance" "notifications" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[0]

  vpc_security_group_ids = var.vpc_security_group_ids

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              systemctl start docker
              systemctl enable docker
              EOF

  tags = {
    Name        = "${var.environment}-notifications-server"
    Environment = var.environment
  }
}

# Recurso: Auto Scaling Group para el servicio de notificaciones
resource "aws_launch_template" "notifications" {
  name_prefix   = "${var.environment}-notifications-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = var.vpc_security_group_ids

  user_data = base64encode(<<-EOF
#!/bin/bash
yum update -y
yum install -y docker
systemctl start docker
systemctl enable docker
EOF
)

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.environment}-notifications-instance"
      Environment = var.environment
    }
  }
}

resource "aws_autoscaling_group" "notifications" {
  name                = "${var.environment}-notifications-asg"
  vpc_zone_identifier = var.subnet_ids
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size

  launch_template {
    id      = aws_launch_template.notifications.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.environment}-notifications-asg-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }
}

# Recurso: Security Group adicional para ELB
resource "aws_security_group" "notifications_elb" {
  name        = "${var.environment}-notifications-elb-sg"
  description = "Security Group para el Application Load Balancer del servicio de notificaciones"
  vpc_id      = var.vpc_security_group_ids[0]

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Salida a instancias"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-notifications-elb-sg"
    Environment = var.environment
  }
}

// === ARCHIVO: modules/compute/outputs.tf ===
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

// === ARCHIVO: environments/dev/terraform.tfvars ===
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

// === ARCHIVO: environments/prod/terraform.tfvars ===
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

// === ARCHIVO: scripts/healthcheck.sh ===
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

// === ARCHIVO: .gitignore ===
# ==============================================================================
# Archivo .gitignore para proyectos de Infraestructura como Código con Terraform
# Ignora archivos temporales, estados y secretos
# ==============================================================================

# Archivos de estado de Terraform
*.tfstate
*.tfstate.*
*.tfstate.backup
terraform.tfstate
terraform.tfstate.*

# Directorio de plugins y proveedores de Terraform
.terraform/
.terraform.lock.hcl
.terraform.d/

# Archivos de logs
*.log
logs/

# Archivos de configuración local (contienen valores específicos del entorno)
# NOTA: Los archivos .tfvars con valores reales NO deben estar en el repositorio
# Usa terraform.tfvars.example como plantilla
*.tfvars
!examples/*.tfvars
!environments/*/terraform.tfvars

# Archivos de backup
*.bak
*~
*.swp
*.swo
*~

# Archivos de IDE y editor
.vscode/
.idea/
*.iml
*.sublime-workspace
*.sublime-project
.DS_Store
Thumbs.db

# Archivos temporales del sistema
*.tmp
*.temp
temp/
tmp/

# Certificados y claves privadas (nunca subir a repositorio)
*.pem
*.key
*.crt
*.cer
*.p12
*.pfx
id_rsa*
id_ed25519*

# Archivos de credentials de AWS
.aws/
~/.aws/credentials
~/.aws/config

# Archivos de Terraform Cloud / Enterprise
.terraformrc
terraform.rc

# Outputs de Terraform que pueden contener información sensible
terraform.output
*.output

# Archivos de lock de dependencias (opcional, puede ser útil versionarlos)
# Descomenta si deseas ignorar los archivos de lock
# *-lock.json
# *-lock.tf

# Archivos de documentación generados
site/

# Kubeconfig y configuraciones de Kubernetes
kubeconfig*
*.kubeconfig

# Archivos de secretos de aplicaciones
secrets.yaml
secrets.yml
secrets.json
*.secret.*

# Archivos de variables de entorno
.env
.env.*
!.env.example

# Build artifacts
*.zip
*.tar.gz
*.tar
dist/
build/

# Archivos de auditoría y compliance
audit/
compliance/

# Terraform plan outputs
*.plan
*.plan.backup

# Module caches
.module-cache/

# Credentials de cloud providers
credentials.json
credentials.yml
credentials.yaml
service-account.json

# Archivos de estado remoto (si se usa estado local temporalmente)
# Estos no deberían subirse nunca
remote-state/

# Terraform workspace state (para workspaces locales)
.terraform.tfstate.lock.info

# Archivos de validación
validation.log

# Override files (permitidos pero no subirlos por defecto)
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Archivos de testing que generan outputs
.terratest/
test-results/

# Dependencias externas
vendor/

# Archivos de configuración de CI/CD que contienen secretos
# Si tu pipeline usa secretos, asegúrate de que estén en variables de entorno
# no hardcodeados en archivos de configuración
.github/secrets/
.azure/secrets/
.gitlab/secrets/

# Python virtual environments (si aplica para scripts)
venv/
env/
.venv/

# Node modules (si aplica para scripts)
node_modules/

# Scripts con credenciales hardcodeadas (prohibido)
# Cualquier script que contenga passwords o API keys debe ser ignorado
*credentials*
*secret*
*password*

// === ARCHIVO: README.md ===
# Infraestructura como Código - Servicio de Notificaciones

Este proyecto contiene la configuración de infraestructura como código utilizando Terraform para el servicio de notificaciones. La infraestructura incluye recursos de red (VPC, subnets, route tables, security groups) y recursos de cómputo (EC2, Auto Scaling Groups).

## Estructura del Proyecto

```
.
├── environments/              # Configuraciones por ambiente
│   ├── dev/                   # Desarrollo
│   │   └── terraform.tfvars
│   └── prod/                  # Producción
│       └── terraform.tfvars
├── modules/                   # Módulos de Terraform reutilizables
│   ├── network/               # Módulo de red (VPC, subnets, rutas)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── compute/               # Módulo de cómputo (EC2, ASG)
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── scripts/                   # Scripts de automatización
│   └── healthcheck.sh         # Verificación de estado
├── main.tf                    # Configuración principal
├── variables.tf               # Variables del root module
├── outputs.tf                 # Outputs del root module
├── providers.tf               # Configuración de proveedores
└── .gitignore                 # Archivos ignorados
```

## Requisitos Previos

- Terraform >= 1.5 instalado
- AWS CLI configurado con credenciales válidas
- Permisos suficientes para crear recursos de AWS

### Instalación de Terraform

**Linux/macOS:**
```bash
wget -q https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip
unzip terraform_1.5.0_linux_amd64.zip
sudo mv terraform /usr/local/bin/
```

**macOS con Homebrew:**
```bash
brew install terraform
```

**Windows:**
Descargar el binario desde https://www.terraform.io/downloads

### Configuración de AWS CLI

```bash
aws configure
```

Ingresa las credenciales de AWS cuando se solicite. Asegúrate de tener el rol IAM adecuado con permisos para crear VPCs, EC2, ASG, y relacionados.

## Uso

### Inicializar Terraform

```bash
terraform init
```

Este comando descarga los proveedores necesarios y prepara el backend de estado.

### Validar Configuración

```bash
terraform validate
```

Valida la sintaxis y consistencia de los archivos de Terraform.

### Planificar Cambios

```bash
terraform plan -var-file=environments/dev/terraform.tfvars
```

Muestra los cambios que se aplicarán sin ejecutarlos. Para producción, usa:
```bash
terraform plan -var-file=environments/prod/terraform.tfvars
```

### Aplicar Cambios

```bash
terraform apply -var-file=environments/dev/terraform.tfvars
```

Para producción:
```bash
terraform apply -var-file=environments/prod/terraform.tfvars
```

### Destruir Infraestructura

```bash
terraform destroy -var-file=environments/dev/terraform.tfvars
```

**Advertencia:** Este comando elimina todos los recursos creados. Úsalo con precaución.

## Verificación de Estado

Ejecuta el script de healthcheck para verificar el estado de los recursos desplegados:

```bash
chmod +x scripts/healthcheck.sh
./scripts/healthcheck.sh
```

O con variables de entorno personalizadas:
```bash
ENVIRONMENT=prod REGION=us-west-2 ./scripts/healthcheck.sh
```

El script verifica:
- Instalación de Terraform
- Estado de Terraform
- Recursos de AWS (VPCs, subnets, ASGs)
- Security Groups
- Conectividad de red

## Ambientes

### Desarrollo (dev)

Configuración optimizada para desarrollo con recursos de menor tamaño.

Ubicación: `environments/dev/terraform.tfvars`

### Producción (prod)

Configuración de producción con alta disponibilidad y recursos dimensionados para producción.

Ubicación: `environments/prod/terraform.tfvars`

## Variables Principales

| Variable | Descripción | Ejemplo |
|----------|-------------|---------|
| region | Región de AWS | us-east-1 |
| environment | Nombre del ambiente | dev, prod |
| vpc_cidr | CIDR de la VPC | 10.0.0.0/16 |
| instance_type | Tipo de instancia EC2 | t3.medium |
| ami_id | ID de la AMI | ami-0c55b159cbfafe1f0 |
| min_size | Tamaño mínimo del ASG | 2 |
| max_size | Tamaño máximo del ASG | 5 |
| desired_capacity | Capacidad deseada del ASG | 2 |

## Módulos

### Módulo Network

Crea la infraestructura de red:
- VPC con CIDR configurable
- Subnets públicas y privadas
- Internet Gateway
- Tablas de rutas
- NAT Gateway para subnets privadas

### Módulo Compute

Crea la infraestructura de cómputo:
- Auto Scaling Group
- Launch Configuration
- Security Groups para las instancias
- Capacidad de auto-scaling

## Outputs

Los outputs principales incluyen:
- ID de la VPC creada
- IDs de subnets públicas y privadas
- ID del Security Group
- ID del Auto Scaling Group
- DNS del Load Balancer (si aplica)

## Mejores Prácticas

1. **Nunca commitees secretos**: No subas archivos .tfvars con credenciales reales
2. **Usa remote backend**: Configura S3 para almacenar el estado de forma remota
3. **Versiona tu código**: Usa Git para controlar cambios en la infraestructura
4. **Plan antes de apply**: Siempre revisa el plan antes de aplicar cambios
5. **Usa workspaces**: Considera usar Terraform workspaces para múltiples ambientes
6. **Implementa gating**: Agrega approve manual antes de apply en producción

## Troubleshooting

### Error: Provider not found

Ejecuta `terraform init` para descargar los proveedores.

### Error: Credentials

Verifica que AWS CLI esté configurado correctamente:
```bash
aws sts get-caller-identity
```

### Error: State locked

Si el estado está bloqueado, ejecuta:
```bash
terraform force-unlock <lock-id>
```

## Referencias

- [Documentación de Terraform](https://www.terraform.io/docs/)
- [Documentación de AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Mejores Prácticas de Terraform](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)

// === ARCHIVO: main.tf ===
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

// === ARCHIVO: outputs.tf ===
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

// === ARCHIVO: Dockerfile ===
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY src/ ./src/
RUN npm run build

FROM node:20-alpine AS runtime

WORKDIR /app

RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./

USER nodejs

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3000/health', (r) => process.exit(r.statusCode === 200 ? 0 : 1))"

CMD ["node", "dist/index.js"]
```
