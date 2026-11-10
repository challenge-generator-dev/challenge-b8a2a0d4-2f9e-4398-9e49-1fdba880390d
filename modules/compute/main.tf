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