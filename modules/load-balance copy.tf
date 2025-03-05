provider "aws" {
    region = "us-east-1"
}

# Criando o Launch Template
resource "aws_launch_template" "asg" {
  name_prefix   = "asg-template"
  image_id      = "ami-00a58472648f8ab89"  # Substitua com o ID da AMI que deseja usar
  instance_type = "t2.micro"
}


# Criando o Auto Scaling Group
resource "aws_autoscaling_group" "asg" {
  name                 = "asg"
  min_size             = 2
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = ["subnet-0e54cdcbe62d91351", "subnet-0a5c5009900617599", "subnet-0f2538a0c20590bdb"]
  
  # Associando o Launch Template ao ASG
  launch_template {
    id      = aws_launch_template.asg.id
    version = "$Latest"
  }

  target_group_arns    = [aws_lb_target_group.target1.arn]

  health_check_type    = "EC2"
  health_check_grace_period = 300
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
