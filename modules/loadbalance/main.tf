# Criando o Load Balancer (ALB)
resource "aws_lb" "trabalho" {
  name               = "trabalho"
  internal           = false
  load_balancer_type = "application"  
  subnets = var.subnets

  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true
}

# Criando o Target Group para o ALB
resource "aws_lb_target_group" "target1" {
  name     = "target1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id 

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
