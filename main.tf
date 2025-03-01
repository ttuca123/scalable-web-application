provider "aws" {
    region = "us-east-1"
}

# Criando o Auto Scaling Group
resource "aws_autoscaling_group" "asg" {
    name = "asg"
    min_size = 2
    max_size = 3
    desired_capacity = 2

    launch_template {
        id = "lt-0a2362ab88b3da744"
        version = "1"
    }

    vpc_zone_identifier = ["subnet-0e54cdcbe62d91351", "subnet-0a5c5009900617599", "subnet-0f2538a0c20590bdb"]

    # Associando o Target Group do ALB com o ASG
    target_group_arns = [aws_lb_target_group.target1.arn]
    
    # Configuração de Health Check
    health_check_type          = "EC2"
    health_check_grace_period  = 300
}

# Criando o Load Balancer (ALB)
resource "aws_lb" "trabalho" {
  name               = "trabalho"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-0909815e7da1c4f41"]
  subnets            = ["subnet-0e54cdcbe62d91351", "subnet-0a5c5009900617599", "subnet-0f2538a0c20590bdb"]

  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true
}

# Criando o Target Group para o ALB
resource "aws_lb_target_group" "target1" {
  name     = "target1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0d75c62eec8f0a12f" 

  health_check {
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Criando a regra de listener para o Load Balancer
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.trabalho.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.target1.arn
    type             = "forward"
  }
}
