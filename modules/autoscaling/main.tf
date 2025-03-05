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